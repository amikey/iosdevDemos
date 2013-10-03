//
//  AssetsLibraryManager.h
//  LBSPhotoSelector
//
//  Created by 侯 坤明 on 13-9-23.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AssetsLibraryManager : NSObject
@property (strong, nonatomic) NSMutableArray *photoList;
@property (strong, nonatomic) NSMutableArray *albumList;

+ (id)sharedInstance;
@end
