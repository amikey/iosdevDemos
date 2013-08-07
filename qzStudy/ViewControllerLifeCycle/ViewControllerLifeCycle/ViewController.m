//
//  ViewController.m
//  ViewControllerLifeCycle
//
//  Created by 侯 坤明 on 13-8-6.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerProperty.h"
#import "MainPage.h"

@interface ViewController ()<MainPageDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"Home";
    ((MainPage *)self.view).delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)gotoControllerPropertyListPage:(id)sender
{
    ViewControllerProperty *propertyController = [[ViewControllerProperty alloc] initWithNibName:@"ViewControllerProperty" bundle:nil];
    [self.navigationController pushViewController:propertyController animated:YES];
}

@end
