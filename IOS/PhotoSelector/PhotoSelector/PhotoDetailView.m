//
//  PhotoDetailView.m
//  PhotoSelector
//
//  Created by 侯 坤明 on 13-9-17.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "PhotoDetailView.h"

@implementation PhotoDetailView{
    UIScrollView *scrollView;
    UIImageView *imageView;
}
- (id)init
{
    if(self = [super init]){
        scrollView = [[UIScrollView alloc] init];
        imageView = [[UIImageView alloc] init];
        [scrollView addSubview:imageView];
        [self.view addSubview:scrollView];
        scrollView.delegate = self;
    }
    UITapGestureRecognizer *recognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClicked:)];
    recognize.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:recognize];
    return self;
}

- (void)setImage:(UIImage *)image
{
    if(_image != image){
        _image = image;
        imageView.image = image;
        imageView.frame = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
        scrollView.contentSize = image.size;
    }
}

- (void)doubleClicked: (id)sender
{
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    scrollView.frame = self.view.bounds;
   if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
}



- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
