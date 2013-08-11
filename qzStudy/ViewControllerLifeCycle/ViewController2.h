//
//  ViewController2.h
//  ViewControllerLifeCycle
//
//  Created by 侯 坤明 on 13-8-11.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalController <NSObject>

-(void)goPre;
-(void)goHome;


@end

@interface ViewController2 : UIViewController
@property (nonatomic, weak)id<ModalController>delegate;
@end
