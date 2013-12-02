//
//  ViewController.m
//  locationTest
//
//  Created by 侯 坤明 on 13-9-23.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.+29.21216667,+104.56966667
    CLLocation *location = [[CLLocation alloc] initWithLatitude:+29.21216667 longitude:+104.56966667];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if(placemarks){
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            NSLog(@"%@,%@", placemark.country, placemark.name);
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
