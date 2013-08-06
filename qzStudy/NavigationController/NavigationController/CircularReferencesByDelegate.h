//
//  CircularReferencesByDelegate.h
//  NavigationController
//
//  Created by 侯 坤明 on 13-8-6.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WrongDelegateClass;
@interface CircularReferencesByDelegate : UIViewController
@property (nonatomic, retain)WrongDelegateClass *wrongDelegate;
@end
