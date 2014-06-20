//
//  ViewController.m
//  cocoaPodsDemo
//
//  Created by 侯 坤明 on 14-1-13.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "FormViewController.h"
#import "FormDataSource.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)gotoFormController:(id)sender {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"f1"] = @"asdf";
    FormDataSource *dataSource = [[FormDataSource alloc] initWithModel:dic];

    FormViewController *ctl = [[FormViewController alloc] initWithNibName:nil bundle:nil formDataSource:dataSource];
    ctl.view.frame = self.view.bounds;
    [self.navigationController pushViewController:ctl animated:YES];
}    
@end
