//
//  CollectionViewCell.h
//  CollectionView
//
//  Created by 侯 坤明 on 13-7-9.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSString *url;
@end
