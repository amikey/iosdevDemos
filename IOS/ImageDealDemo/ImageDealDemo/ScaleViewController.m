//
//  ScaleViewController.m
//  ImageDealDemo
//
//  Created by 侯 坤明 on 13-9-11.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ScaleViewController.h"
#import "UIImage+Resize.h"

@interface ScaleViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (strong, nonatomic) UIImage *image;

@end

@implementation ScaleViewController

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
    self.image = [UIImage imageNamed:@"5.jpg"];
    self.imageView.image = self.image;
    CGRect rect = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
    self.imageView.frame = rect;
    [self.scrollView clipsToBounds];
    self.scrollView.contentSize = rect.size;
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor grayColor];
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
- (IBAction)scaleChanged:(id)sender {
    float scale = ((UISlider *)sender).value * 2;
    UIImage *image = [self.image resizeImage:CGSizeMake(self.image.size.width * scale, self.image.size.height * scale)];
    self.messageLabel.text = [NSString stringWithFormat:@"%.2f", scale];
    self.imageView.image = image;
    self.scrollView.contentSize = image.size;
}

@end
