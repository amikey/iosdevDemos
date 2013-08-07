//
//  CustomTableCell.h
//  qz_tableView_demo
//
//  Created by 侯 坤明 on 13-8-1.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedDataModule.h"

@interface CustomTableCell : UITableViewCell
-(void)renderWithData: (FeedDataModule *)feedData;
@end

