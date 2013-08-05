//
//  ViewController.m
//  qz_tableView_correct_2
//
//  Created by 侯 坤明 on 13-8-5.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "FeedListDataModule.h"
#import "FeedDataModule.h"
#import "CustomTableCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, TableViewCell>
@property (retain, nonatomic) UITableView *tableView;
@property (retain, nonatomic) NSMutableArray *feedList;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.feedList = [[FeedListDataModule alloc] getFeedDatas];
    self.tableView = [[UITableView alloc]initWithFrame: self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.feedList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ((FeedDataModule *)[self.feedList objectAtIndex:indexPath.row]).cellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"feed table cell"];
    if(cell == nil){
        cell = [[CustomTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"feed table cell"];
    }
    cell.delegate = self;
    [cell renderWithData: [self.feedList objectAtIndex:indexPath.row]];
    return cell;
}


-(void)updateHeight
{
    NSLog(@"reload table");
    [self.tableView reloadData];
}

@end
