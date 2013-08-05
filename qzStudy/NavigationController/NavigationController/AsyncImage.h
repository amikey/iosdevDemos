//
//  AsyncImage.h
//  NavigationController
//
//  Created by 侯 坤明 on 13-8-5.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AsyncImage <NSObject>

-(void)loadedImage: (UIImage *)image;

@end

@interface AsyncImage : NSObject
@property (retain, nonatomic) id<AsyncImage> delegate;
-(void)loadImageWithUrl: (NSString *)urlstr;
@end
