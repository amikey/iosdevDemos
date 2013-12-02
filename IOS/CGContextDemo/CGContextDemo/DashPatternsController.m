//
//  DashPatternsController.m
//  CGContextDemo
//
//  Created by 侯 坤明 on 13-8-30.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "DashPatternsController.h"
#import "DashPatterns.h"

@interface DashPatternsController ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet DashPatterns *drawView;
@property (weak, nonatomic) IBOutlet UISlider *phaseSlider;
@property (weak, nonatomic) IBOutlet UIButton *phaseResetButton;
@property (weak, nonatomic) IBOutlet UIPickerView *dashTypePicker;
@property (nonatomic) int dashTypeSelectedIndex;
@end

static Pattern patterns[] = {
    {{10, 10}, 2},
    {{10, 20, 10}, 3},
};
static NSInteger patterCount = sizeof(patterns) / sizeof(patterns[0]);
@implementation DashPatternsController

#pragma mark pickerView delegate
-(int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return patterCount;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.dashTypeSelectedIndex = row;
    [self resetDrawView];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    Pattern p = patterns[row];
    NSMutableString *str = [NSMutableString stringWithFormat:@"%.0f", p.patterns[0]];
    for(int i = 1; i < p.count; i++){
        [str appendFormat: @"-%.0f", p.patterns[i]];
    }
    return str;
}

- (IBAction)phaseChanged:(id)sender {
    [self resetDrawView];
}

- (IBAction)resetPhase:(id)sender {
    self.phaseSlider.value = 0.5;
    [self resetDrawView];
}

-(void)resetDrawView
{
    self.drawView.dashPhase = self.phaseSlider.value * 50 - 25;
    self.drawView.dashPattern = patterns[self.dashTypeSelectedIndex];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.dashTypePicker.delegate = self;
    self.dashTypePicker.dataSource = self;
    self.phaseSlider.value = 0.5;
    [self.dashTypePicker selectRow:0 inComponent:0 animated:NO];
    [self resetDrawView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
