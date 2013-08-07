//
//  ControllerPropertyView.m
//  ViewControllerLifeCycle
//
//  Created by 侯 坤明 on 13-8-6.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ControllerPropertyView.h"
@interface ControllerPropertyView()
{
    NSMutableDictionary *controllerInfoArray;
    UIViewController *controller;
    UITextView *resultText;
}
@end

@implementation ControllerPropertyView
-(id)init
{
    NSLog(@"init");
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        resultText = [[UITextView alloc] init];
        resultText.frame = CGRectMake(10, 10, 300, 300);
        resultText.text = @"default text";
        [self addSubview:resultText];
    }
    NSLog(@"init with frame");
    return self;
}

-(void)showControllerInforWithController: (UIViewController *)ctl
{
    if(controller != ctl){
        controller = ctl;
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect
{
    NSString *str = @"";
    if(controller != nil){
        NSString *view = [NSString stringWithFormat:@"view: \n%@", controller.view];
        str = [NSString stringWithFormat:@"%@%@", str, view];
        resultText.text = str;
    }
}

@end
