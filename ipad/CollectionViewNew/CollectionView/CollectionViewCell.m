//
//  CollectionViewCell.m
//  CollectionView
//
//  Created by 侯 坤明 on 13-7-9.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "CollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) setUrl:(NSString *)url
{
    UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:url];
    if(image == nil)
    {
        [self.imageView setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
            [[SDImageCache sharedImageCache] storeImage:image forKey:url];
        }];
    }else
    {
        self.imageView.image = image;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
