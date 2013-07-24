//
//  ImageFocusScrollView.h
//  CollectionView
//
//  Created by 侯 坤明 on 13-7-10.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageFocusScrollView : UIScrollView
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
-(void)displayImage: (UIImage *) image;
@end
