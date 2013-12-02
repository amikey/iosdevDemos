//
//  PhotoBrowerViewController.h
//  PhotoBrowser
//
//  Created by 侯 坤明 on 13-11-18.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PhotoBrowserDelegate <NSObject>

- (void)didScrollToPage: (NSInteger)page;

@end

@interface PhotoBrowerViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *photoList;
@property (nonatomic, weak) id<PhotoBrowserDelegate> delegate;

- (id)initWithImage: (UIImage *)image;
- (void)insertPhotoList:(NSArray *)array atIndexes:(NSIndexSet *)indexes;
- (void)deletePhotos: (NSArray *)array atIndexes: (NSIndexSet *)indexes;

@end
