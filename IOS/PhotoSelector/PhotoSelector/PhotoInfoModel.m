//
//  PhotoInfoModel.m
//  PhotoSelector
//
//  Created by 侯 坤明 on 13-9-16.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "PhotoInfoModel.h"

@implementation PhotoInfoModel

- (void)setLocation:(CLLocation *)location
{
    if(_location != location){
        _location = location;
        [self getLocationName:location];
    }
}

- (void)getLocationName: (CLLocation *)location
{
    CLGeocoder *clGeoCoder = [[CLGeocoder alloc] init];
    [clGeoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark *placeMark in placemarks) {
            self.locationName = placeMark.name;
        }
    }];
}
@end
