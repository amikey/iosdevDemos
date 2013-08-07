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
    
    
}

-(IBAction)gotoPropertyListPage:(id)sender
{
    if(self.delegate != nil){
        [self.delegate gotoControllerPropertyListPage:self];
    }
}

@end
