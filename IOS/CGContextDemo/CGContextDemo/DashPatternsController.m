//
//  DashPatternsController.m
//  CGContextDemo
//
//  Created by 侯 坤明 on 13-8-30.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "DashPatternsController.h"
#import "DashPatterns.h"

@interface DashPatternsController ()
@property (weak, nonatomic) IBOutlet DashPatterns *drawView;
@property (weak, nonatomic) IBOutlet UISlider *phaseSlider;
@property (weak, nonatomic) IBOutlet UIButton *phaseResetButton;
@property (weak, nonatomic) IBOutlet UIPickerView *dashTypePicker;

@end

@implementation DashPatternsController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
