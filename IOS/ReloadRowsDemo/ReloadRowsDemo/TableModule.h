//
//  TableModule.h
//  ReloadRowsDemo
//
//  Created by 侯 坤明 on 13-8-4.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableModule : NSObject
@property (strong, nonatomic) NSString *urlStr;
@property (strong, nonatomic) UIImage *image;
@property (assign, nonatomic) CGRect rect;
@property (assign, nonatomic) CGFloat height;
-(TableModule *)initWithUrlStr: (NSString *)urlStr;
@end
