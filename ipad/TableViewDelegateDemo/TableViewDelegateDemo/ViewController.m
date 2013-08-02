//
//  ViewController.m
//  TableViewDelegateDemo
//
//  Created by 侯 坤明 on 13-7-6.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

NSString *const kTableCellIdentifier = @"myTableViewCell";
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSDictionary *item1 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"title1", @"title",
                           @"footer1", @"footer",
                           [NSMutableArray arrayWithObjects: @"1-1", @"1-2",@"1-3", @"1-4", @"1-5", nil], @"list"
                           , nil];
    NSDictionary *item2 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"title2", @"title",
                           @"footer2", @"footer",
                           [NSMutableArray arrayWithObjects: @"2-1", @"2-2", @"2-3", @"2-4", nil], @"list"
                           , nil];
    NSDictionary *item3 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"title3", @"title",
                           @"footer3", @"footer",
                           [NSMutableArray arrayWithObjects: @"3-1", @"3-2", @"3-3", @"3-4", nil], @"list"
                           , nil];
    self.dataSource = [NSMutableArray arrayWithObjects:item1, item2, item3, nil];
    
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editTable:(id)sender {
    if([((UIBarButtonItem *)sender).title isEqualToString: @"save"]){
        NSLog(@"now dataList is %@", self.dataSource);
        [self.myTable setEditing:NO animated:YES];
        ((UIBarButtonItem *)sender).title = @"edit";
    }else{
        [self.myTable setEditing:YES animated:YES];
        ((UIBarButtonItem *)sender).title = @"save";
    }
}


//________________________________________________________________________________________________________________________

//UITableViewDatasource protocols @required，必须提供的有两个，一个返回行数，一个返回需要显示的UITableViewCell
//表格的行数, 多个section且不同的时候可以分别指定
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self.dataSource objectAtIndex:section]objectForKey:@"list"] count];
}
//返回一行 UITableViewCell对象
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //根据Identifier来复制现有的cell得到新cell，这个是IOS的对table的优化，即使上万条也不会卡，没有显示的cell实际已经被释放了，进入可见区域时再重新实例化一个
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: kTableCellIdentifier];
    //如果是第一个item则为空, 需要实例化一个
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier: kTableCellIdentifier];
    }
    cell.textLabel.text = [[[self.dataSource objectAtIndex:[indexPath section]] objectForKey:@"list"] objectAtIndex:[indexPath row]];
    cell.detailTextLabel.text = @"hello";
    
    
    NSLog(@"inited %@", indexPath);
    return cell;
}

//_____________________________________________________________
//UITableViewDataSource protocols @optional 非必选有9个

//___________________________
//显示相关方法

//返回section 分组个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataSource count];
}
//返回分组标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat: @"hi, I'm a header named %@", [[self.dataSource objectAtIndex:section] objectForKey:@"title"]];
}
//返回分组footer文字
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [NSString stringWithFormat: @"hi, I'm a footer named %@", [[self.dataSource objectAtIndex:section]objectForKey:@"footer"]];
}

//___________________________
// 编辑的相关方法

//可编辑行设定, 可编辑行当向右滑动时会出删除等操作按钮，必须结合下面两个方法一起使用
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


//指定向右滑动时显示出来的按钮类型 这个方法不是dataSource的，而是来自 delegate
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        return UITableViewCellEditingStyleDelete;
    }else if(indexPath.section ==1){
        return UITableViewCellEditingStyleInsert;
    }else{
        return UITableViewCellEditingStyleNone;
    }
        
}
//点击操作按钮时执行的动作
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *type;
    //删除按钮
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        type = @"delete";
        //删除行，必须先删除数据中对应的项，再删除row，否则会报错
        [[[self.dataSource objectAtIndex:[indexPath section]]objectForKey:@"list"] removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    //添加按钮
    }else if(editingStyle == UITableViewCellEditingStyleInsert)
    {
        type = @"insert";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: kTableCellIdentifier];
        cell.textLabel.text = @"this is added cell";
        [[[self.dataSource objectAtIndex:indexPath.section] objectForKey:@"list"] insertObject:@"this is added cell" atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }else
    {
        type = @"default";
    }
    NSLog(@"you clicked button %@", type);
}


//是否可以移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section == 1; //第二个分组才让可移动
}
//移动事件完成时
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    id object = [[[self.dataSource objectAtIndex:sourceIndexPath.section] objectForKey:@"list"] objectAtIndex:sourceIndexPath.row];
    [[[self.dataSource objectAtIndex:sourceIndexPath.section] objectForKey:@"list"] removeObjectAtIndex:sourceIndexPath.row];
    [[[self.dataSource objectAtIndex:destinationIndexPath.section] objectForKey:@"list"] insertObject:object atIndex:destinationIndexPath.row];
}

//给表格分组建立索引，可以通过点击索引快速定位到分组，像
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return @[@"A",@"B",@"C"];
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSLog(@"sectionforSectionIndexTitle is %@", title);
    return index;
}

//________________________________________________________________________________________________________________________
//UITableViewDelegate protocols 都是非必须 数了下一共有30个

//___________________________
//自定义显示的 有6个
//在显示前，可以自定义cell，比如实现斑马纹
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row%2 == 0){//偶数行加背景色
        cell.backgroundColor = [UIColor colorWithRed:0.8 green:0.9 blue:0.9 alpha:1];
    }
}
//显示前自定义header
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{}
//显示前自定义footer
-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{}
//cell 消失时触发（滑出显示区和删除）
-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didEndDisplayingCell section: %d, row: %d", indexPath.section, indexPath.row);
}
//header消失时
-(void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
{}
//footer消失时
-(void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section
{}

//___________________________
//自定义高度 有3个
//自定义行高
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.00;
}
//定义header高度
-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0;
}
//定义footer高度
-(float)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50.0;
}

//___________________________
//自定义header, footer view
//自定义header view 
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section == 1){//第二个section的header
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 4, 300, 30)];
        label.text = @"this is a custom header title";
        label.backgroundColor = [UIColor clearColor];
        [view addSubview:label];
        view.backgroundColor = [UIColor yellowColor];
        return view;
    }else{
        return nil;
    }
}
//自定义footer view
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if(section == 1)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 4, 300, 30)];
        label.text = @"this is a custom foooter title";
        label.backgroundColor = [UIColor clearColor];
        [view addSubview:label];
        view.backgroundColor = [UIColor yellowColor];
        return view;
    }else
    {
        return nil;
    }
}

//右侧功能按钮___________________________
//自定义右侧功能按钮类别
-(UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        return UITableViewCellAccessoryCheckmark;
    }else if(indexPath.row == 1)
    {
        return UITableViewCellAccessoryDetailDisclosureButton;
    }else if(indexPath.row == 2)
    {
        return UITableViewCellAccessoryDisclosureIndicator;
    }else
    {
        return UITableViewCellAccessoryNone;
    }
}

//点击了右侧的小按钮
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了%d分组%d行的accessoryButton", [indexPath section], [indexPath row]);
}


//Selection 选中相关功能___________________________
//行是否可被选中并高亮
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row%2 == 0){
        return YES;
    }else{
        return NO;
    }
}

//选中行
-(void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"you hightlighted %@", indexPath);
}

//取消选中的行
-(void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"you unhightlighted %@", indexPath);
}

//将要选中行之前可以重新定义要选中的行
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
    //return nil;//返回nil则不会有蓝色背影的选中状态了，但还是会触发didHightlightRowAtIndexPath
}

//将要删除行时可以自定义要删除的行
-(NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

//选中行后
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //更新右侧选中标签
    UITableViewCell *curCell = [tableView cellForRowAtIndexPath:indexPath];
    if(curCell.accessoryType == UITableViewCellAccessoryCheckmark)
    {
        curCell.accessoryType = UITableViewCellAccessoryNone;
    }else if(curCell.accessoryType == UITableViewCellAccessoryNone)
    {
        curCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    NSLog(@"you selected %@", indexPath);
}

//取消选中后
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"you deselect %@", indexPath);
}

//editing 编辑相关功能___________________________
//返回编辑类别 在上面已经申明，[tableView setEditing: YES]编辑状态时出现
//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath

//删除按钮上的文本
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"are you sure delete?";
}

//编辑状态时是否缩进，这个对UITableViewCellEditinStyleNone有用，因为其他两个delete和insert的前面会出按钮，必须要缩进的
-(BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

//通过滑动出现插入、删除、移动操作时，目前我只实现出向右滑动出现删除按钮
-(void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willBeginEditingRowAtIndexPath: %@", indexPath);
}

//通过滑动出现的操作状态失去时，取消或者完成都会触发
-(void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didEndEditingRowAtIndexPath: %@", indexPath);
}

//移动行时可以自定义目标位置
-(NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    NSLog(@"sourceIndexPath %@, toProposedIndexPath: %@", sourceIndexPath, proposedDestinationIndexPath);
    return proposedDestinationIndexPath;//[NSIndexPath indexPathForRow:1 inSection:0];
}

//控制缩进
-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)return 1;
    if(indexPath.section == 1)return 3;
    return 5;
}

//长按出 copy/paste action气泡________________________
//允许长按弹出菜单
-(BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//可指定弹出的action类别，一共有cut,copy,selectAll,paste
-(BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    if(action != @selector(selectAll:)){
        return YES;
    }
    return NO;
}
//点击action执行内容
-(void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    NSString *act = nil;
    if(action == @selector(copy:)){
        act = @"copy";
    }else if(action == @selector(paste:)){
        act = @"paste";
    }else if(action == @selector(cut:)){
        act = @"cut";
    }else if(action == @selector(selectAll:)){
        act = @"selectAll";
    }
    NSLog(@"performAction: %@, forRow: %@, sender: %@", act, indexPath, sender);
}



@end
