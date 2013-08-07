//
//  ViewController.m
//  qz_tableView_demo
//
//  Created by 侯 坤明 on 13-8-1.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "FeedListDataModule.h"
#import "FeedDataModule.h"
#import "CustomTableCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (assign, nonatomic) IBOutlet UITableView *feedListTable;
@property (nonatomic, retain) NSMutableArray *feedList;
@property (nonatomic, retain) NSMutableDictionary *tableRowHeightMap;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.feedListTable.dataSource = self;
    self.feedListTable.delegate = self;
    self.feedList = [[FeedListDataModule alloc] getFeedDatas];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//tableview datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.feedList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Feed table view cell id"];
    if(cell == nil)
    {
        cell = [[CustomTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: @"Feed table view cell id"];
    }
    [(CustomTableCell *)cell renderWithData: [self.feedList objectAtIndex: indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
    return ((FeedDataModule *)[self.feedList objectAtIndex:indexPath.row]).cellHeight;
}




@end
