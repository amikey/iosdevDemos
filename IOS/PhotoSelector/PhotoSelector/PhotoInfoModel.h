//
//  PhotoInfoModel.h
//  PhotoSelector
//
//  Created by 侯 坤明 on 13-9-16.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <CoreLocation/CoreLocation.h>

@interface PhotoInfoModel : NSObject
@property (strong, nonatomic)UIImage *thumbImage;
@property (nonatomic) CGImageRef cgImage;
@property (nonatomic) BOOL isChecked;
@property (strong, nonatomic) ALAssetRepresentation *representation;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) CLLocation *location;
@property (strong, nonatomic) NSString *locationName;
@end
