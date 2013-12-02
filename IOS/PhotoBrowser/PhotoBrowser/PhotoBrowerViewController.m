//
//  PhotoBrowerViewController.m
//  PhotoBrowser
//
//  Created by 侯 坤明 on 13-11-18.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "PhotoBrowerViewController.h"

@interface PhotoBrowerViewController (){
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}

@end

@implementation PhotoBrowerViewController

- (id)init
{
    self = [super init];
    if(self){
        _photoList = [NSMutableArray array];
    }
    return self;
}

- (id)initWithImage: (UIImage *)image
{
    self = [self init];
    if(self){
        [_photoList addObject:image];
    }
    return self;
}

- (void)viewDidLoad
{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.contentSize = [self getScrollViewContentSize];
}

- (CGSize)getScrollViewContentSize
{
    return CGSizeMake(_photoList.count * self.view.bounds.size.width, self.view.bounds.size.height);
}

- (void)insertPhotoList:(NSArray *)array atIndexes:(NSIndexSet *)indexes
{
    
}

- (void)deletePhotos: (NSArray *)array atIndexes: (NSIndexSet *)indexes
{
    
}
@end
