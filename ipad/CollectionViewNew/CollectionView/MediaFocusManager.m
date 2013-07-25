//
//  MediaFocusManager.m
//  CollectionView
//
//  Created by 侯 坤明 on 13-7-10.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "MediaFocusManager.h"
#import "MediaFocusViewController.h"
#import "ImageFocusScrollView.h"
@interface MediaFocusManager()
@property (strong, nonatomic) MediaFocusViewController *mediaFocusController;
@end
@implementation MediaFocusManager
-(id)init
{
    self = [super init];
    if(self)
    {
    }
    return self;
}
-(void)showBigImageWithURL:(NSString *)urlStr inView:(UIViewController *)parentControler
{
    if(!self.mediaFocusController)
    {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        MediaFocusViewController *mediaController = [storyBoard instantiateViewControllerWithIdentifier:@"mediaFocusViewController"];
        self.mediaFocusController = [mediaController initWithParentView: parentControler.view];
        [parentControler addChildViewController:self.mediaFocusController];
    }
    [self.mediaFocusController displayImageWithURL:urlStr];
}

@end
