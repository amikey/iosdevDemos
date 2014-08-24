//
//  ViewController.m
//  pushTest
//
//  Created by 侯 坤明 on 14-7-3.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "firstViewController.h"

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIViewController *ctr = [[UIViewController alloc] init];
    ctr.title = @"new view ctr";
    ctr.view.backgroundColor = [UIColor orangeColor];
    
    [self.navigationController pushViewController:ctr animated:NO];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UIViewController *ctr1 = [[firstViewController alloc] init];
    ctr1.title = @"controller 1";
    ctr1.view.backgroundColor = [UIColor blueColor];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:ctr1];
    
    [self presentViewController:nav  animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
