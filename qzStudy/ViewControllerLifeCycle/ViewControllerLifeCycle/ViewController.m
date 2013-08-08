//
//  ViewController.m
//  ViewControllerLifeCycle
//
//  Created by 侯 坤明 on 13-8-6.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerProperty.h"
#import "MainPage.h"
#import "ViewControllerMethod.h"
#import "PresentViewControllerExecOrderController.h"

@interface ViewController ()<MainPageDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"UIViewController";
    ((MainPage *)self.view).delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)gotoControllerPropertyListPage:(id)sender
{
    ViewControllerProperty *propertyController = [[ViewControllerProperty alloc] initWithNibName:@"ViewControllerProperty" bundle:nil];
    [self.navigationController pushViewController:propertyController animated:YES];
}

-(void)gotoControllerExecOrder:(id)sender
{
    ViewControllerMethod *execOrderController = [[ViewControllerMethod alloc] initWithNibName:@"ViewControllerMethod" bundle:nil];
    [self.navigationController pushViewController:execOrderController animated:YES];
}

-(void)gotoPresentControllerExecOrder:(id)sender
{
    PresentViewControllerExecOrderController *execOrderController = [[PresentViewControllerExecOrderController alloc] initWithNibName:@"PresentViewControllerExecOrderController" bundle:nil];
    execOrderController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    execOrderController.modalPresentationStyle = UIModalPresentationFormSheet;
    execOrderController.modalPresentationStyle = UIModalPresentationFormSheet;
    
    NSLog(@"viewController, isBeingPresented is %@", execOrderController.isBeingPresented ? @"YES" : @"NO");
    [self.navigationController presentViewController:execOrderController animated:YES completion:^{
        NSLog(@"viewController-completion, presentViewController presented comletion");
        NSLog(@"viewController-completion, isBeingPresented is %@", execOrderController.isBeingPresented ? @"YES" : @"NO");
    }];
     NSLog(@"viewController, isBeingPresented is %@", execOrderController.isBeingPresented ? @"YES" : @"NO");

}

-(void)showModalController:(id)sender
{
    PresentViewControllerExecOrderController *execOrderController = [[PresentViewControllerExecOrderController alloc] initWithNibName:@"PresentViewControllerExecOrderController" bundle:nil];
    
    //过渡效果：
    //UIModalTransitionStyleCoverVertical: 默认从下往上覆盖
    //UIModalTransitionStyleCrossDissolve: 渐隐
    //UIModalTransitionStyleFlipHorizontal: 3D翻转
    //UIModalTransitionStylePartialCurl: 撕页效果
    execOrderController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    execOrderController.modalInPopover = YES;
    execOrderController.modalPresentationStyle = UIModalPresentationFormSheet;
    [self.navigationController presentModalViewController:execOrderController animated:YES];
}


@end
