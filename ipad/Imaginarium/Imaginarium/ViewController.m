//
//  ViewController.m
//  Imaginarium
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
@synthesize scrollView;
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = self.imageView.image.size;
    self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
}

@end
