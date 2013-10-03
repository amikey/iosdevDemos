//
//  LBSGroupedViewController.m
//  LBSPhotoSelector
//
//  Created by 侯 坤明 on 13-9-23.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "LBSGroupedViewController.h"
#import "AssetsLibraryManager.h"

@interface LBSGroupedViewController ()
@property (strong, nonatomic) AssetsLibraryManager *assetsLibraryManager;

@end

@implementation LBSGroupedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _assetsLibraryManager = [AssetsLibraryManager sharedInstance];
    
    
}
@end
