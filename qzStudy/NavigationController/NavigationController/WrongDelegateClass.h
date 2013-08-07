//
//  WrongDelegateClass.h
//  NavigationController
//
//  Created by 侯 坤明 on 13-8-6.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WrongDelegateClass <NSObject>


@end
@interface WrongDelegateClass : NSObject
@property (nonatomic, retain) id<WrongDelegateClass> delegate;//delegate使用强引用，则会出现循环引用的情况，导致无法释放
@end
