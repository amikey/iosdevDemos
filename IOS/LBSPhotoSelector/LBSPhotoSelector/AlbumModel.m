//
//  albumModel.m
//  LBSPhotoSelector
//
//  Created by 侯 坤明 on 13-9-24.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "AlbumModel.h"

@implementation AlbumModel
- (id)init
{
    if(self = [super init]){
        self.status = DEFAULT;
    }
    return self;
}
@end
