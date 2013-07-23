//
//  ViewController.m
//  cacheImageWithSDWebImage
//
//  Created by 侯 坤明 on 13-7-14.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.imageView.hidden = YES;
//    [self.imageView setImageWithURL:[NSURL URLWithString:@"http://pic.33.la/20130407bz/388.jpg"] placeholderImage:[UIImage imageNamed:@"loading.gif"] options:0 progress:^(NSUInteger receivedSize, long long expectedSize) {
//        NSString *str = [NSString stringWithFormat:@"loading... %@, %@", receivedSize, expectedSize];
//        NSLog(str);
//        self.loadingText.text = str;
//    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
//        //self.loadingText.hidden = YES;
//        self.imageView.hidden = NO;
//    }];
//    
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:@"http://pic.33.la/20130407bz/386.jpg"] options:0 progress:^(NSUInteger receivedSize, long long expectedSize) {
        NSString *persent = [NSString stringWithFormat:@"loading: %.0f%%", ((float)receivedSize / (float)expectedSize) * 100.00];
        self.loadingText.text = persent;
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        self.imageView.image = image;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
