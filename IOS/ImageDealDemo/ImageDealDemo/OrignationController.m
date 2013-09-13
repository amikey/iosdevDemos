//
//  OrignationController.m
//  ImageDealDemo
//
//  Created by 侯 坤明 on 13-9-10.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "OrignationController.h"
#import "UIImage+Resize.h"
#import "UIImage+Rotate.h"

@interface OrignationController ()
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISlider *radianSlider;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (nonatomic) float currentDegree;
@end

@implementation OrignationController

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
    UIImage *image = [UIImage imageNamed:@"5.jpg"];
    image = [image resizeImage:CGSizeMake(200, 300)];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:imageView];
    // imageView.transform = CGAffineTransformMakeRotation(M_PI/4);
    self.imageView = imageView;
    self.image = image;
    CGSize size = image.size;
    CGRect rect = CGRectMake(60, 100, 0, 0);
    rect.size = size;
    self.imageView.frame = rect;
    self.imageView.backgroundColor = [UIColor grayColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setImageDigree: (float)radian
{
    self.messageLabel.text = [NSString stringWithFormat:@"%.0f", radian * 180 / M_PI];
    UIImage *image = [self.image rotateImageWithRadian:radian];
    self.imageView.image = image;
    CGSize size = image.size;
    NSLog(@"%f , %f", size.width, size.height);
    CGRect rect = self.imageView.frame;
    rect.size = size;
    CGSize boundsSize = self.view.bounds.size;
    rect.origin.x = boundsSize.width / 2 - size.width / 2;
    rect.origin.y = boundsSize.height / 2 - size.height / 2 - 100;
    self.imageView.frame = rect;
}
- (IBAction)radianChanged:(id)sender {
   float radian = roundf((((UISlider *)sender).value * M_PI * 4 - M_PI * 2) * 100.0)/100.0;
    [self setImageDigree:radian];
}
- (IBAction)add90Degree:(id)sender {
    self.currentDegree += 90;
    float radian = self.currentDegree * M_PI / 180;
    [self setImageDigree:radian];
}
- (IBAction)less90Degree:(id)sender {
    self.currentDegree -= 90;
    float radian = self.currentDegree * M_PI / 180;
    [self setImageDigree:radian];
}



@end
