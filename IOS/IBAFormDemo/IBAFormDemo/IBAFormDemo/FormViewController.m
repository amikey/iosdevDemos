//
//  FormViewController.m
//  IBAFormDemo
//
//  Created by 侯 坤明 on 14-1-8.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "FormViewController.h"

@interface FormViewController (){

}

@end

@implementation FormViewController

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.view = view;
    UITableView *atableView = [[UITableView alloc] initWithFrame:view.bounds style:UITableViewStyleGrouped];
    atableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [view addSubview:atableView];
    self.tableView = atableView;
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
