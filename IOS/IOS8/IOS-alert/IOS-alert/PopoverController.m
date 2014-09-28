//
//  PopoverController.m
//  IOS-alert
//
//  Created by 侯 坤明 on 14-9-23.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "PopoverController.h"

@implementation PopoverController
- (IBAction)closeButtonTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
