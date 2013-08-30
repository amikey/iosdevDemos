//
//  CapJoinWidthController.m
//  CGContextDemo
//
//  Created by 侯 坤明 on 13-8-30.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "CapJoinWidthController.h"
#import "CapJoinWidth.h"

@interface CapJoinWidthController ()
@property (weak, nonatomic) IBOutlet CapJoinWidth *drawOutView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *capSeagment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *joinSeagment;
@property (weak, nonatomic) IBOutlet UISlider *widthSlider;

@end

@implementation CapJoinWidthController

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
    self.drawOutView.lineCap = [self.capSeagment selectedSegmentIndex];
    self.drawOutView.lineJoin = [self.joinSeagment selectedSegmentIndex];
    self.drawOutView.lineWidth = self.widthSlider.value * 20;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)capTypeChanged:(id)sender {
    self.drawOutView.lineCap = [sender selectedSegmentIndex];
}

- (IBAction)joinTypeChanged:(id)sender {
    self.drawOutView.lineJoin = [sender selectedSegmentIndex];
}

- (IBAction)widthChanged:(id)sender {
    self.drawOutView.lineWidth = self.widthSlider.value * 20;
}

@end
