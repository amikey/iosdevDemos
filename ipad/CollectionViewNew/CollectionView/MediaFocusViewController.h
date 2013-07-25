//
//  MediaFocusViewController.h
//  CollectionView
//
//  Created by 侯 坤明 on 13-7-10.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageFocusScrollView.h"

@interface MediaFocusViewController : UIViewController
@property (strong, nonatomic) IBOutlet ImageFocusScrollView *scrollView;
-(id)initWithParentView: (id)parentView;
-(void)displayImageWithURL: (NSString *)urlStr;
@end
