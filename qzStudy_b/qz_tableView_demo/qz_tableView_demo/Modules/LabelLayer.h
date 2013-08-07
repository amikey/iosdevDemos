//
//  LabelLayer.h
//  qz_tableView_demo
//
//  Created by 侯 坤明 on 13-8-2.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LabelLayer : NSObject
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) UIFont *font;
@property (nonatomic, retain) UIColor *fontColor;
@property (nonatomic, retain) UIColor *bgColor;
@property (nonatomic, assign) UITextAlignment align;
@property (nonatomic, assign) UILineBreakMode lineBreakMode;
@property (nonatomic, assign) CGRect rect;
-(id)initWithDictionary: (NSMutableDictionary *) map;
@end
