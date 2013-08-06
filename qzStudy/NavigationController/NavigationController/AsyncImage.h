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

@class DeallocTest;
@interface AsyncImage : NSObject

//这里申明weak和 assign两种类型的delegate, 在于区别这两个类型的不同
//weak和assign的区别在于：weak类别的delegate在内存清空的时候其指针会被自动置为nil，而assign不会，使得assignDelegate内存释放后就会成为野指针，导致crash

@property (weak, nonatomic) id<AsyncImage> delegate;
@property (assign, nonatomic) id<AsyncImage> assignDelegate;


-(void)loadImageWithUrl: (NSString *)urlstr;
-(void)wrongBlock_loadImageWithUrl: (NSString *)urlstr;
-(void)assignDelegate_wrong_loadImageWithUrl: (NSString *)urlstr;
-(void)assignDelegate_changeToWeak_loadImageWithUrl: (NSString *)urlstr;
@end

