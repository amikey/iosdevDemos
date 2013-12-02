//
//  ViewController.m
//  PushRefreshDataDemo
//
//  Created by 侯 坤明 on 13-9-13.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "PushLoadingView.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (strong,nonatomic) PushLoadingView *loadingView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.loadingView = [[PushLoadingView alloc] initWithSize: CGSizeMake(self.view.bounds.size.width, 300)];
    self.loadingView.insetTop = 50;
    self.loadingView.backgroundColor = [UIColor grayColor];
    self.loadingView.scrollView = (UIScrollView *)self.tableView;
    self.loadingView.delegate = self;
    [self.tableView addSubview:self.loadingView];
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrolling ");
    [self.loadingView update];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.loadingView endDrag];
}

@end
