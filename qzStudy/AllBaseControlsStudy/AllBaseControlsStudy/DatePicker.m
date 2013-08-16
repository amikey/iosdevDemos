//
//  DatePicker.m
//  AllBaseControlsStudy
//
//  Created by 侯 坤明 on 13-8-12.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "DatePicker.h"

@interface DatePicker ()

@end

@implementation DatePicker

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(10, 10, 300, 200)];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:datePicker];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
