//
//  PhotoInfoModel.h
//  LBSPhotoSelector
//
//  Created by 侯 坤明 on 13-9-24.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <CoreLocation/CoreLocation.h>

@interface PhotoInfoModel : NSObject<NSCoding>
@property (strong, nonatomic) NSString *uid;
@property (strong, nonatomic) ALAsset *asset;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) CLLocation *location;
@end
