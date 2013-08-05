//
//  BlockTestController.m
//  NavigationController
//
//  Created by 侯 坤明 on 13-8-5.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "BlockTestController.h"
#import "AsyncImage.h"

@interface BlockTestController ()<AsyncImage>

@end

@implementation BlockTestController

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
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"Run block test" forState:UIControlStateNormal];
    btn.frame = CGRectMake(50, 100, 200, 30);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(runBlockTest:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)runBlockTest:(id)sender
{
    AsyncImage *asyncLoad = [[AsyncImage alloc] init];
    asyncLoad.delegate = self;
    [asyncLoad loadImageWithUrl:@"http://img.xoyin.com/hulu/1/20120906/ccc2dfa7-e483-436c-b707-dfeb3d42143f.jpg"];
}

-(void)loadedImage:(UIImage *)image
{
    NSLog(@"loaded image");
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(10, 150, 200, 200);
    [self.view addSubview:imageView];
}

-(void)dealloc
{
    NSLog(@"Block test page dealloced");
}


@end
