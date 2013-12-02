//
//  PhotoListCell.h
//  PhotoSelector
//
//  Created by 侯 坤明 on 13-9-16.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoInfoModel.h"
#import "CommonDefine.h"

@protocol PhotoListCellDelegate <NSObject>

- (void)photoClicked: (int)index sender: (id)sender;

@end

@interface PhotoListCell : UITableViewCell
@property (weak, nonatomic) id<PhotoListCellDelegate> delegate;
@property (nonatomic) int rowNumber;
@property (nonatomic) P_STATUS status;
- (void)renderWithData: (NSArray *)photo;

@end
