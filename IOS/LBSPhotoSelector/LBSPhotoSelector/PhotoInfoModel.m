//
//  PhotoInfoModel.m
//  LBSPhotoSelector
//
//  Created by 侯 坤明 on 13-9-24.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "PhotoInfoModel.h"

@implementation PhotoInfoModel
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.asset forKey:@"asset"];
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.location forKey:@"location"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init]){
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.asset = [aDecoder decodeObjectForKey:@"asset"];
        self.date = [aDecoder decodeObjectForKey:@"date"];
        self.location = [aDecoder decodeObjectForKey:@"location"];
    }
    return self;
}
@end
