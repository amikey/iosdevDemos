//
//  SearchKey.h
//  CoreDataDemo
//
//  Created by 侯 坤明 on 13-8-27.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Photo;

@interface SearchKey : NSManagedObject

@property (nonatomic, retain) NSString * keyName;
@property (nonatomic, retain) NSSet *photos;
@end

@interface SearchKey (CoreDataGeneratedAccessors)

- (void)addPhotosObject:(Photo *)value;
- (void)removePhotosObject:(Photo *)value;
- (void)addPhotos:(NSSet *)values;
- (void)removePhotos:(NSSet *)values;

@end
