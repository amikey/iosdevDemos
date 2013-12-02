//
//  albumModel.h
//  LBSPhotoSelector
//
//  Created by 侯 坤明 on 13-9-24.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

typedef enum {
    DEFAULT = 0,
    LOADINGASSETS,
    LOADINGLBS,
    ASSETSLOADED,
    LBSLOADED
} ALBUMSTATUS;

#import <Foundation/Foundation.h>

@interface AlbumModel : NSObject
@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSInteger photoCount;
@property (nonatomic) CGImageRef posterCGImage;
@property (nonatomic) ALBUMSTATUS status;
@end
