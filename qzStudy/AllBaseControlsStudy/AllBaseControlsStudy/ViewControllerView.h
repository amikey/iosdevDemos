//
//  ViewControllerView.h
//  AllBaseControlsStudy
//
//  Created by 侯 坤明 on 13-8-8.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ViewControllerViewDelegate <NSObject>
-(void)gotoUISegmented;
-(void)gotoUITextField;
-(void)gotoUISlider;
-(void)gotoUITextViewPage;
-(void)gotoDatePickerPage;
-(void)gotoPickerViewPage;
@end

@interface ViewControllerView : UIScrollView
@property(assign, nonatomic)id<ViewControllerViewDelegate> delegate2;
-(void)createAllControls;

@end
