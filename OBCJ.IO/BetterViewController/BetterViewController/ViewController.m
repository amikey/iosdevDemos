//
//  ViewController.m
//  BetterViewController
//
//  Created by 侯 坤明 on 14-6-26.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSMutableArray *items;
@end

@implementation ViewController

- (id)init
{
    if(self = [super init]){
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = 
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
