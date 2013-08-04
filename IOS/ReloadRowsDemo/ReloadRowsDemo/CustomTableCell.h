//
//  CustomTableCell.h
//  ReloadRowsDemo
//
//  Created by 侯 坤明 on 13-8-4.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TableModule;
@interface CustomTableCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
-(void)setImageWithModule: (TableModule *)tableData callBack:  (void(^)(void))block;
@end
