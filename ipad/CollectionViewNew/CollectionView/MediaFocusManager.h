//
//  MediaFocusManager.h
//  CollectionView
//
//  Created by 侯 坤明 on 13-7-10.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MediaFocusManager;
@protocol MediaFocusDelegate <NSObject>
@required
-(UIViewController *)parentViewControllerForView: (MediaFocusManager *)mediaFocusManager;
@end
@interface MediaFocusManager : NSObject
@property (nonatomic, assign) id<MediaFocusDelegate> delegate;
@property (strong, nonatomic) UIColor *backgroundColor;
-(void)showBigImageWithURL: (NSURL *)url inView: (UIView *) parentView;
@end
