//
//  ViewController.m
//  IOS-alert
//
//  Created by 侯 坤明 on 14-9-5.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "PopoverController.h"

@interface ViewController ()<UIPopoverPresentationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{    
    self.navigationController.hidesBarsOnSwipe = YES;
    self.navigationController.hidesBarsOnTap = YES;
    self.navigationController.hidesBarsWhenKeyboardAppears = YES;
    self.navigationController.hidesBarsWhenVerticallyCompact = YES;
    
    self.navigationController.hidesBottomBarWhenPushed = YES;
}

//popover button touched
- (IBAction)codePopoverButtonTouched:(UIButton *)sender {
    //内容controller
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *popViewController = [storyboard instantiateViewControllerWithIdentifier:@"PopoverController"];
    popViewController.view.backgroundColor = [UIColor colorWithRed:0.5 green:0.2 blue:0.9 alpha:0.5];
    //设置style为popover
    popViewController.modalPresentationStyle = UIModalPresentationPopover;
    
    //popoverControler属性, ipad下需要设置才能正确显示, 不设置sourceView会crash, iphone下始终全屏显示
    UIPopoverPresentationController *popoverPresentationController = popViewController.popoverPresentationController;
    popoverPresentationController.sourceView = sender;
    popoverPresentationController.sourceRect = sender.bounds;
    popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp | UIPopoverArrowDirectionRight;//箭头方向, 与pop出现方向相反
    
    popoverPresentationController.delegate = self;
        
    
    [self presentViewController:popViewController animated:YES completion:nil];
}

//FullScreen模式,
//.FullScreen or .OverFullScreen, the difference being that fullscreen will remove the presenting view controller's view,
//whereas over-fullscreen won't.
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationFullScreen;
}

//是否显示NavigationBar
- (UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller.presentedViewController];
    return nav;
}

//alert button touched
- (IBAction)alertButtonTouched:(id)sender {
    //申明alertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"this is a Alert!!"
                                                                             message:@"alert's message."
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    //添加textField
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"input something...";
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"input other something...";
    }];

    //添加按钮
    [alertController addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"you inputed: %@", ((UITextField *)alertController.textFields[0]).text);
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    //显示
    [self presentViewController:alertController animated:YES completion:nil];
}

//action sheet button touched
- (IBAction)actionSheetButtonTouched:(UIButton *)sender {
    //申明alertController
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:@"this is a actionSheet!!"
                                                                             message:@"actionSheet's message."
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    //添加按钮
    [actionSheetController addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [actionSheetController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [actionSheetController addAction:[UIAlertAction actionWithTitle:@"others..." style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    //actionSheet需要指定presentationController属性, 否则ipad下会crash
    UIPopoverPresentationController *popoverPresentationController = actionSheetController.popoverPresentationController;
    popoverPresentationController.sourceView = sender;
    popoverPresentationController.sourceRect = sender.bounds;

    
    //显示
    [self presentViewController:actionSheetController animated:YES completion:nil];
}


@end
