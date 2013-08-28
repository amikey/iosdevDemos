//
//  Photo.h
//  CoreDataDemo
//
//  Created by 侯 坤明 on 13-8-27.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PhotoDetail, SearchKey;

@interface Photo : NSManagedObject

@property (nonatomic, retain) NSString * imageId;
@property (nonatomic, retain) NSString * keyName;
@property (nonatomic, retain) NSString * originContextUrl;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) PhotoDetail *photoDetail;
@property (nonatomic, retain) SearchKey *whoTook;

@end
