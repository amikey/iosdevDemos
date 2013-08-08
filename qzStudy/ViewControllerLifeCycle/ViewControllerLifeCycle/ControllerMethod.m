//
//  ControllerMethod.m
//  ViewControllerLifeCycle
//
//  Created by 侯 坤明 on 13-8-7.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ControllerMethod.h"
@interface ControllerMethod()
{
    UITextView *textView;
}
@end

@implementation ControllerMethod

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    if(textView == nil){
        
        [@"普通push进窗口的UIViewController 生命周期" drawAtPoint:CGPointMake(10,10) forWidth:300 withFont:[UIFont fontWithName:@"arial" size:13] lineBreakMode:NSLineBreakByWordWrapping];
        textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 30, 300, 300)];
        textView.editable = NO;
        textView.font = [UIFont fontWithName:@"arial" size:16];
        textView.textColor = [UIColor blueColor];
        [self addSubview:textView];

        NSString *str = @"1. init;\n\n 2. viewDidLoad;\n\n 3. viewWillAppear; \n\n 4. viewDidAppear; \n\n 5. viewWillDisappear; \n\n 6. viewDidDisappear;\n";
        textView.text = str;
        
    }
}

@end
