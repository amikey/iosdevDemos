//
//  CABaseAnimationViewController.m
//  coreAnimationDemo
//
//  Created by 侯 坤明 on 14-8-10.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "CABaseAnimationViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface CABaseAnimationViewController ()

@end

@implementation CABaseAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CALayer *layer1 = [[CALayer alloc] init];
    layer1.frame = CGRectMake(0, 100, 50, 50);
    layer1.backgroundColor = [UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:layer1];
    
    
    CABasicAnimation *animate = [CABasicAnimation animation];
    animate.keyPath = @"position";
    animate.byValue = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
    animate.duration = 1;
    animate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [layer1 addAnimation:animate forKey:@"layer1Animation"];
    
    //layer1.position  = CGPointMake(200, 100);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
