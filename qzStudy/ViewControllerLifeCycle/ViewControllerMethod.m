//
//  ViewControllerMethod.m
//  ViewControllerLifeCycle
//
//  Created by 侯 坤明 on 13-8-7.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewControllerMethod.h"

@interface ViewControllerMethod ()

@end

@implementation ViewControllerMethod

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    NSLog(@"initWithNibName");
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"viewDidLoad");
    NSLog(@"isViewLoaded is %@", [self isViewLoaded] ? @"YES" : @"NO");
}

-(void)viewWillUnload
{
    [super viewWillUnload];
    NSLog(@"viewWillUnload");
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    NSLog(@"viewDidUnload");
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"didReceiveMemoryWarning");
}



@end
