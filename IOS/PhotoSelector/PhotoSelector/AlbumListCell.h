//
//  AlbumListCell.h
//  PhotoSelector
//
//  Created by 侯 坤明 on 13-9-16.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AssetsLibrary/AssetsLibrary.h"
#import "AlbumModel.h"

@interface AlbumListCell : UITableViewCell
- (void)renderWithGroupinfo: (AlbumModel *)album;
@end