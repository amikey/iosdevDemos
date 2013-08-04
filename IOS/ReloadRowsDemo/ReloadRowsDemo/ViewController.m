//
//  ViewController.m
//  ReloadRowsDemo
//
//  Created by 侯 坤明 on 13-8-4.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "TableModule.h"
#import "CustomTableCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataList;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.dataList = [NSMutableArray arrayWithObjects:
                     [[TableModule alloc] initWithUrlStr: @"http://www.qhstv.com/img/b01-0928-015129.jpg" ],
                     [[TableModule alloc] initWithUrlStr: @"http://b.hiphotos.baidu.com/album/w%3D2048/sign=6cf310c221a446237ecaa262ac1a730e/e850352ac65c10385292a47ab3119313b17e899d.jpg" ],
                     [[TableModule alloc] initWithUrlStr: @"http://h.hiphotos.baidu.com/album/w%3D2048/sign=64197d1c5bafa40f3cc6c9dd9f5c024f/a08b87d6277f9e2f10e1d7261e30e924b999f3cc.jpg" ],
                     [[TableModule alloc] initWithUrlStr: @"http://c.hiphotos.baidu.com/album/w%3D2048/sign=99d4ce66cefc1e17fdbf8b317ea8f703/0bd162d9f2d3572ccba2e5ac8b13632762d0c37a.jpg" ],
                      nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ((TableModule *)[self.dataList objectAtIndex:indexPath.row]).height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"custom table cell"];
    if(cell == nil){
        cell = [[CustomTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"custom table cell"];
    }
    TableModule *dataModule = (TableModule *)[self.dataList objectAtIndex:indexPath.row];
    if(dataModule.image == nil){
        [cell setImageWithModule:dataModule callBack:^{
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            NSLog(@"update index path: %@", indexPath);
        }];
    }
    return cell;
}

@end
