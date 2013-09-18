//
//  AlbumModel.h
//  PhotoSelector
//
//  Created by 侯 坤明 on 13-9-16.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumModel : NSObject
@property (strong, nonatomic)NSString *name;
@property (nonatomic)int photoCount;
@property (nonatomic)UIImage *posterImage;
@end
