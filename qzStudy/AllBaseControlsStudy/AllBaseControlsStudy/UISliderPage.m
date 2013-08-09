//
//  UISliderPage.m
//  AllBaseControlsStudy
//
//  Created by 侯 坤明 on 13-8-9.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "UISliderPage.h"

@interface UISliderPage ()
{
    UISlider *slider;
    UILabel *info;
}

@end

@implementation UISliderPage

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
    slider = [[UISlider alloc]initWithFrame:CGRectMake(10, 10, 300, 30)];
    slider.minimumValue = 10;
    slider.maximumValue = 90;
    slider.minimumTrackTintColor = [UIColor greenColor];
    slider.maximumTrackTintColor = [UIColor blackColor];
    slider.thumbTintColor = [UIColor redColor];
    [slider setThumbImage:[UIImage imageNamed:@"Button-play-2-16.png"] forState:UIControlStateHighlighted];
    [slider setMinimumTrackImage:[UIImage imageNamed:@"btn2.png"] forState:UIControlStateNormal];
    [slider setValue:50 animated:YES];
    slider.value = 89;
    
    [slider addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:slider];
    
    info = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 300, 300)];
    info.lineBreakMode = UILineBreakModeWordWrap;
    info.numberOfLines = 0;
    
    
    [self.view addSubview:info];
    [self showInfo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showInfo
{
    NSString *str = @"";
    str = [NSString stringWithFormat:@"\n%@\n%@ %f", str, @"value:", slider.value];
    str = [NSString stringWithFormat:@"\n%@\n%@ %f", str, @"minimumValue:", slider.minimumValue];
    str = [NSString stringWithFormat:@"\n%@\n%@ %f", str, @"maximumValue:", slider.maximumValue];
    info.text = str;
}

-(IBAction)valueChange:(id)sender
{
    [self showInfo];
}
@end
