//
//  Photography.h
//  CoreDataDemo
//
//  Created by 侯 坤明 on 13-7-28.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Photos;

@interface Photography : NSManagedObject

@property (nonatomic, retain) NSNumber * height;
@property (nonatomic, retain) NSString * tburl;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSNumber * width;
@property (nonatomic, retain) NSString * imageId;
@property (nonatomic, retain) Photos *whoTook;

@end
