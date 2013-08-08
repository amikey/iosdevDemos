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
    NSMutableArray *controllerInfoArray;
    UIViewController *controller;
    UITextView *resultText;
}
@end


@implementation ControllerPropertyView


-(void)showControllerInforWithController: (UIViewController *)ctl
{
    NSLog(@"%@, %@", controller, ctl);
    if(controller != ctl){
        controller = ctl;
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect
{
    NSLog(@"view drawRected");
    NSString *str = @"";
    if(controller != nil){
        [@"UIViewController 的 property 列表:" drawAtPoint:CGPointMake(10, 10) forWidth:300 withFont:[UIFont fontWithName:@"arial" size:14] lineBreakMode:UILineBreakModeWordWrap];
        NSMutableArray *arr = [NSMutableArray array];
        
        for(int i = 0; i < controllerInfoArray.count; i++){
            NSDictionary *item = [controllerInfoArray objectAtIndex:i];
            NSString *propertyName = [item objectForKey:@"name"];
            NSLog(propertyName);
            str = [NSString stringWithFormat:@"%@%d. %@: \n%@\n%@\n\n", str, i+1, propertyName, [item objectForKey:@"desc"], [controller valueForKey:propertyName]];
        }
        
        
        
        
        for(int i = 0; i < arr.count; i++){
            str = [NSString stringWithFormat:@"%@%d. %@\n\n", str, i+1, [arr objectAtIndex:i]];
        }
        
        resultText.text = str;
    }
}

-(void)willMoveToWindow:(UIWindow *)newWindow
{
    NSLog(@"willMoveToWindow");
    if(resultText == nil){
        resultText = [[UITextView alloc] init];
        resultText.editable = NO;
        resultText.frame = CGRectMake(10, 30, 300, 300);
        resultText.text = @"default text";
        [self addSubview:resultText];
    }
    if(controllerInfoArray == nil){
        controllerInfoArray = [NSMutableArray arrayWithObjects:
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"view", @"name",
                                            @"controller 的 view", @"desc",
                                     nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"nibName", @"name",
                                @"controller 的 nibName", @"desc",
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"nibBundle", @"name",
                                @"controller 的 nibBundle(资源路径对象)", @"desc",
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"storyboard", @"name",
                                @"controller 的 storyboard", @"desc",
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"title", @"name",
                                @"controller 的 title, 会显示到Navigation bar中间", @"desc",
                                nil],
                               
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"parentViewController", @"name",
                                @"controller 的父controller", @"desc",
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"modalViewController", @"name",
                                @"controller 添加的modal子视图，已经被presentedViewController替换", @"desc",
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"presentedViewController", @"name",
                                @"controller 通过present方式添加到窗口的controllers（被present的） （多个时是离其最近的父controller）", @"desc",
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"presentingViewController", @"name",
                                @"当前controller 被哪个父controllor通过present方式添加窗口的（present别人的） （多个时是离其最远的父controller）", @"desc",
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"definesPresentationContext", @"name",
                                @"unknown", @"desc",
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"providesPresentationContextTransitionStyle", @"name",
                                @"controller是否可以自定义过渡类型", @"desc",
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"isBeingPresented", @"name",
                                @"是否正被父controller present", @"desc",
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"isBeingDismissed", @"name",
                                @"是否正dismiss", @"desc",
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"isMovingToParentViewController", @"name",
                                @"是否正被当成child view controller 添加到父controller", @"desc",
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"isMovingFromParentViewController", @"name",
                                @"是否正被父controller移除", @"desc",
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"modalTransitionStyle", @"name",
                                @"设置被模态显示controller的过渡效果", @"desc",
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"modalPresentationStyle", @"name",
                                @"模态窗口的样式", @"desc",
                                nil],
                               
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"wantsFullScreenLayout", @"name",
                                @"是否全屏显示", @"desc",
                                nil],
                               
                               
                               nil];
    }
}
-(void)willMoveToSuperview:(UIView *)newSuperview
{
    NSLog(@"willMoveToSuperview");
}

@end
