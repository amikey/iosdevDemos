//
//  MainPage.h
//  ViewControllerLifeCycle
//
//  Created by 侯 坤明 on 13-8-6.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainPageDelegate <NSObject>

-(void)gotoControllerPropertyListPage:(id)sender;
-(void)gotoControllerExecOrder:(id)sender;
-(void)gotoPresentControllerExecOrder:(id)sender;
-(void)showModalController:(id)sender;

@end

@interface MainPage : UIView
@property (assign, nonatomic) id<MainPageDelegate>delegate;

@end
