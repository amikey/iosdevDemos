//
//  PhotoTableCell.h
//  photoApp
//
//  Created by 侯 坤明 on 13-7-4.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoTableCell : UITableViewCell
-(void) setImgs:(NSString *) src1 src2:(NSString *) src2 src3:(NSString *)src3;

@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;


@end
