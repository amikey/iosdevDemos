//
//  PickerView.m
//  AllBaseControlsStudy
//
//  Created by 侯 坤明 on 13-8-12.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "PickerView.h"

@interface PickerView ()<UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *dataList;
    NSArray *items;
}

@end

@implementation PickerView

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
    
    dataList = [NSArray arrayWithObjects:@"item1", @"item2", @"item3", nil];
    items = @[
              @[@"1", @"2", @"3"],
              @[@"a", @"b", @"c", @"d"],
              @[@"xx", @"cc", @"ee"]
              ];
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 10, 300, 50)];
    picker.delegate = self;
    [self.view addSubview:picker];
}
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return items.count;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return  ((NSArray *)[items objectAtIndex:component]).count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[items objectAtIndex:component] objectAtIndex:row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
