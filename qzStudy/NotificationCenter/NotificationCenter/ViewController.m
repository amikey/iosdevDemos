//
//  ViewController.m
//  NotificationCenter
//
//  Created by 侯 坤明 on 13-8-12.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listen:) name:@"kkk" object:self];
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(sendNotification:) userInfo:@"kkk" repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)listen:(id)sender
{
    NSLog(@"%@", sender);
}
-(void)sendNotification:(NSTimer *)timer
{
    NSLog(@"timer run with %@", timer.userInfo);
    [[NSNotificationCenter defaultCenter] postNotificationName:timer.userInfo object:self];
}

@end
