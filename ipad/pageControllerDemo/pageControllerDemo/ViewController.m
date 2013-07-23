//
//  ViewController.m
//  pageControllerDemo
//
//  Created by 侯 坤明 on 13-7-15.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "pageController.h"

@interface ViewController ()<UIPageViewControllerDataSource, UIPageViewControllerDelegate>
{
    NSMutableArray *pageList;
    NSArray *dataList;
    UIPageViewController *pageController;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    dataList = @[@"page 1", @"page 2", @"page 3"];
    NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin] forKey:UIPageViewControllerOptionSpineLocationKey];
    pageController = [[UIPageViewController ] 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - delegate
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    pageViewController *pc = [pageViewController initWithTransitionStyle:(UIPageViewControllerTransitionStyle) navigationOrientation:<#(UIPageViewControllerNavigationOrientation)#> options:<#(NSDictionary *)#>]
}
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    
}
@end
