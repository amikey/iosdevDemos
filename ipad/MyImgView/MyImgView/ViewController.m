//
//  ViewController.m
//  MyImgView
// 
//  Created by 侯 坤明 on 13-7-7.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.scrollView.contentSize = self.imageView.image.size;
    self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
    
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
