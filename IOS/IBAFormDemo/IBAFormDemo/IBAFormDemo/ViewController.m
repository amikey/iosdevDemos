//
//  ViewController.m
//  IBAFormDemo
//
//  Created by 侯 坤明 on 14-1-8.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "FormViewController.h"
#import "DataSource.h"
#import <objc/runtime.h>

@interface ViewController (){
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"goto form" forState:UIControlStateNormal];
    btn1.frame = CGRectMake(50, 50, 200, 200);
    btn1.layer.backgroundColor = [UIColor grayColor].CGColor;
    [self.view addSubview:btn1];
    
    [btn1 addTarget:self action:@selector(gotoForm:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)gotoForm:(id)sender
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"text"] = @"asdf";
    NSObject *obj = [[NSObject alloc] init];
    objc_setAssociatedObject(obj, @"text", @"bbb", OBJC_ASSOCIATION_RETAIN);
	// Values set on the model will be reflected in the form fields.
    DataSource *dataSource = [[DataSource alloc]initWithModel:obj];
    FormViewController *ctl = [[FormViewController alloc] initWithNibName:nil bundle:nil formDataSource:dataSource];
    
    [self presentViewController:ctl animated:YES completion:nil];
}



@end
