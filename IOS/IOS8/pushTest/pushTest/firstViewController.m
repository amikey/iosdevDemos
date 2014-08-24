//
//  firstViewController.m
//  pushTest
//
//  Created by 侯 坤明 on 14-7-3.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "firstViewController.h"

@interface firstViewController ()

@end

@implementation firstViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 - (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIViewController *ctr = [[UIViewController alloc] init];
    ctr.title = @"controller pushed";
    ctr.view.backgroundColor= [UIColor redColor];
    
    [self.navigationController pushViewController:ctr animated:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
