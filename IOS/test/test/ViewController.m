//
//  ViewController.m
//  test
//
//  Created by 侯 坤明 on 13-8-16.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSObject *name;
@property (retain)NSObject *lName;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   // self.name = @"asdfd";
    _name = [[NSObject alloc] init];
    //self.lName = _name;
//    NSLog(@"%d", _name.retainCount);
//    self.lName = _name;
//    NSLog(@"%d", _name.retainCount);
//
//    [_name release];
//    NSLog(@"%d", _name.retainCount);
//    [self.lName release];
//    
//    _name = nil;
//    _lName = nil;
//    NSLog(@"%d", _name.retainCount);
//    
//    NSLog(@"%@", _lName);
    int * a;
    int b = 8;
    a = &b;
    
    NSLog(@"%d",*a);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
