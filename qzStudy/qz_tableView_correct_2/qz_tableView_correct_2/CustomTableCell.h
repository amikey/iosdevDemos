//
//  CustomTableCell.h
//  qz_tableView_demo
//
//  Created by 侯 坤明 on 13-8-1.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedDataModule.h"

@protocol TableViewCell <NSObject>

-(void)updateHeight;

@end

@interface CustomTableCell : UITableViewCell
{
   ///id<TableViewCell>  _delegate;
}

-(void)renderWithData: (FeedDataModule *)feedData;
@property (assign, nonatomic) id<TableViewCell> delegate;

@end

