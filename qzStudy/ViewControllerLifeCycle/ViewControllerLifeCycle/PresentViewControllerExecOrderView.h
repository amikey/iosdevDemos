//
//  PresentViewControllerExecOrderView.h
//  ViewControllerLifeCycle
//
//  Created by 侯 坤明 on 13-8-7.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PresentViewDelegate <NSObject>

-(void)gotoBackPage:(id)sender;

@end
@interface PresentViewControllerExecOrderView : UIView
@property(weak, nonatomic)id<PresentViewDelegate> delegate;
@end
