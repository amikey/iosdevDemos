//
//  MediaFocusViewController.m
//  CollectionView
//
//  Created by 侯 坤明 on 13-7-10.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "MediaFocusViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MediaFocusViewController ()
{
    SDImageCache *_imageCache;
}
@property (strong, nonatomic) IBOutlet UILabel *loadingText;
@end

@implementation MediaFocusViewController
-(id)initWithParentView: (UIView *)parentView
{
    //缓存图片，申明一个自定义空间，也可以用默认的 [SDImageCache sharedImageCache]
    _imageCache = [[SDImageCache alloc]initWithNamespace:@"myImageCache"];
    
    //初始化
    self.view.frame = parentView.bounds;
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:100 alpha:0.5];
    
    //点击事件
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeBigImageHandler:)];
    [self.view addGestureRecognizer:tapGesture];
    
    //初始化滚动视图
    [self.scrollView initWithFrame:parentView.bounds];
    
    [parentView addSubview:self.view];
    return self;
}
-(void)displayImageWithURL:(NSString *)urlStr
{
    self.scrollView.hidden = YES;
    self.loadingText.hidden = NO;
    self.view.hidden = NO;
    
    //从缓存读图片
    UIImage *image = [_imageCache imageFromDiskCacheForKey:urlStr];
    if(image == nil)
    {
        [self loadWebImageWithUrl:urlStr];
    }else
    {
        self.loadingText.hidden = YES;
        self.scrollView.hidden = NO;
        [self.scrollView displayImage:image];
    }
}
//异步加载网络图片
-(void)loadWebImageWithUrl: (NSString *)urlStr
{
    NSURL *url = [NSURL URLWithString:urlStr];
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:url options:0 progress:^(NSUInteger receivedSize, long long expectedSize) {
        self.loadingText.text = [NSString stringWithFormat:@"Loading %.0f%%", (float)receivedSize / (float)expectedSize * 100.00];
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        self.loadingText.hidden = YES;
        self.scrollView.hidden = NO;
        [self.scrollView displayImage:image];
        //执行图片缓存
        [_imageCache storeImage:image forKey:urlStr];
    }];
}
//清空缓存
-(void)clearImageCache
{
    [_imageCache clearMemory];
    [_imageCache clearDisk];
    [_imageCache cleanDisk];
}
//点击浮层关闭
-(void)closeBigImageHandler:(UIGestureRecognizer *)gesture
{
    self.view.hidden = YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}
-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self clearImageCache];
}
@end
