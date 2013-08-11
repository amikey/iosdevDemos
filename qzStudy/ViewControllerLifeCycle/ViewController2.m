//
//  ViewController2.m
//  ViewControllerLifeCycle
//
//  Created by 侯 坤明 on 13-8-11.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (strong, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation ViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)goHome:(id)sender {
    [self.delegate goHome];
}
- (IBAction)gotoBack:(id)sender {
    [self.delegate goPre];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
