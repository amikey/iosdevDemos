//
//  MainPage.m
//  ViewControllerLifeCycle
//
//  Created by 侯 坤明 on 13-8-6.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "MainPage.h"


@implementation MainPage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(10, 10, 300, 30);
    [btn1 setTitle:@"default interface property" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(gotoPropertyListPage:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(10, 50, 300, 30);
    [btn2 setTitle:@"普通controller 执行顺序" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(gotoControllerExecOrder:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.frame = CGRectMake(10, 90, 300, 30);
    [btn3 setTitle:@"present controller 执行顺序" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(gotoPresentControllerExecOrder:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn4.frame = CGRectMake(10, 130, 300, 30);
    [btn4 setTitle:@"present modal controller 执行顺序" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(showModalController:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn4];
    
    
}

-(IBAction)gotoPropertyListPage:(id)sender
{
    if(self.delegate != nil){
        [self.delegate gotoControllerPropertyListPage:self];
    }
}

-(IBAction)gotoControllerExecOrder:(id)sender
{
    if(self.delegate != nil){
        [self.delegate gotoControllerExecOrder:self];
    }
}

-(IBAction)gotoPresentControllerExecOrder:(id)sender
{
    if(self.delegate != nil){
        [self.delegate gotoPresentControllerExecOrder:self];
    }
}

-(IBAction)showModalController:(id)sender
{
    if(self.delegate != nil){
        [self.delegate showModalController:self];
    }
}
@end
