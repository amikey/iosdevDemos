//
//  PresentViewControllerExecOrderView.m
//  ViewControllerLifeCycle
//
//  Created by 侯 坤明 on 13-8-7.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "PresentViewControllerExecOrderView.h"

@implementation PresentViewControllerExecOrderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    NSLog(@"initwithFrame");
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(10, 10, 300, 30);
    [btn1 setTitle:@"返回" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(gotoBackPage:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn1];

}

-(IBAction)gotoBackPage:(id)sender
{
    if(self.delegate != nil){
        [self.delegate gotoBackPage:self];
    }
}
@end
