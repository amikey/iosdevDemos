//
//  ViewController.m
//  ObjectiveRecordDemo
//
//  Created by 侯 坤明 on 14-2-16.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "CAR.h"
#import <ObjectiveRecord.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CAR *car = [CAR create];
    car.name = @"name";
    [car save];
    NSLog(@"success");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
