//
//  ViewController.m
//  SmileFaceAPIDemo
//
//  Created by 侯 坤明 on 13-11-18.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"

@interface ViewController ()<UIScrollViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    MainView *_faceView;
    UIScrollView *_scrollView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    UIImage *image = [UIImage imageNamed:@"facePhoto.jpg"];
    _faceView = [[MainView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [_scrollView addSubview:_faceView];
    
    _scrollView.contentSize = image.size;
    _scrollView.frame = self.view.bounds;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    _scrollView.multipleTouchEnabled = YES;
    _scrollView.maximumZoomScale = 3.0;
    _scrollView.minimumZoomScale = 1.0;
    _faceView.image = image;
    
    UIButton *selectButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [selectButton setTitle:@"选择图片" forState:UIControlStateNormal];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    selectButton.frame = CGRectMake(0, screenSize.height - 40, screenSize.width, 30);
    [selectButton addTarget:self action:@selector(selectButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectButton];

}

- (void)selectButtonClicked
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    _scrollView.contentSize = image.size;
    _scrollView.frame = self.view.bounds;
    _scrollView.zoomScale = self.view.bounds.size.width / image.size.width;
    _faceView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [picker dismissViewControllerAnimated:YES completion:nil];
    _faceView.image = image;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    
}
@end
