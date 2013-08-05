//
//  ViewController.m
//  NavigationController
//
//  Created by 侯 坤明 on 13-8-5.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "BlockTestController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 200, 30)];
    label.text = @"Home Page";
    label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"Go to blockTest Page" forState:UIControlStateNormal];
    btn.frame = CGRectMake(50, 200, 200, 30);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(gotoBlockPage:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)gotoBlockPage:(id)sender
{
    BlockTestController *blockPage = [[BlockTestController alloc] init];
    [self.navigationController pushViewController:blockPage animated:YES];
}


@end
