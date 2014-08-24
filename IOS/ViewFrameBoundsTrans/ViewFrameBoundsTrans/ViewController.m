//
//  ViewController.m
//  ViewFrameBoundsTrans
//
//  Created by 侯 坤明 on 14-8-18.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIView *box;
@property (strong, nonatomic) IBOutlet UILabel *outputLabel;
@property (strong, nonatomic) IBOutlet UITextField *frameInput;
@property (strong, nonatomic) IBOutlet UITextField *boundsInput;
@property (strong, nonatomic) IBOutlet UITextField *centerInput;
@property (strong, nonatomic) IBOutlet UITextField *anchorInput;
@property (strong, nonatomic) IBOutlet UITextField *scaleInput;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.outputLabel.numberOfLines = 0;
    self.outputLabel.lineBreakMode = UILineBreakModeCharacterWrap;
    
    //self.frameInput.delegate = self;
    
    [self outputInfo];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignFirstResponder)];
    [self.view addGestureRecognizer:tap];
}

- (void)resignFirstResponder
{
    [super resignFirstResponder];
    [self.frameInput resignFirstResponder];
    [self.boundsInput resignFirstResponder];
    [self.centerInput resignFirstResponder];
    [self.anchorInput resignFirstResponder];
    [self.scaleInput resignFirstResponder];
}

- (void)outputInfo
{
    CGRect frame = self.box.frame, bounds = self.box.bounds;
    CGPoint anchor = self.box.layer.anchorPoint;
    NSString *output = [NSString stringWithFormat:@"frame: (%.0f, %.0f, %.0f, %.0f), \nbounds: (%.0f, %.0f, %.0f, %.0f), \nanchorPoint: (%.0f, %.0f)",
          frame.origin.x, frame.origin.y, frame.size.width, frame.size.height,
          bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height,
          anchor.x, anchor.y
          ];
    self.outputLabel.text = output;
}

- (IBAction)frameInputed:(id)sender {
   // [self.frameInput resignFirstResponder];
    NSString *str = self.frameInput.text;
    CGRect rect = CGRectFromString(str);
    if(!CGRectIsEmpty(rect)){
        [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.box.frame = rect;
        } completion:^(BOOL finished) {
            [self outputInfo];
        }];
    }
}


- (IBAction)boundsInputed:(id)sender {
}
- (IBAction)centerInputed:(id)sender {
}
- (IBAction)anchorInputed:(id)sender {
}
- (IBAction)scaleInputed:(id)sender {
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect bounds = self.view.bounds;
    bounds.origin.y += 200;
    self.view.bounds = bounds;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect bounds = self.view.bounds;
    bounds.origin.y = 0;
    self.view.bounds = bounds;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
