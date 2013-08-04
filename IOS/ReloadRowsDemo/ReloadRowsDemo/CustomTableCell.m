//
//  CustomTableCell.m
//  ReloadRowsDemo
//
//  Created by 侯 坤明 on 13-8-4.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "CustomTableCell.h"
#import "TableModule.h"

@implementation CustomTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setImageWithModule: (TableModule *)tableData callBack:  (void(^)(void))block
{
    NSLog(@"url is %@", tableData.urlStr);
    if(tableData.image == nil){
        dispatch_queue_t queue = dispatch_queue_create("loadImageQueue", nil);
        dispatch_async(queue, ^{
            NSURL *url = [NSURL URLWithString: tableData.urlStr];
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
                tableData.image = image;
                CGFloat winWidth = [UIScreen mainScreen].bounds.size.width;
                CGSize imageSize = image.size;
                CGRect rect = CGRectMake(0, 10, 0, 0);
                if(imageSize.width > winWidth){
                    rect.origin.x = (winWidth - imageSize.width)/2;
                    rect.size.width = winWidth;
                    rect.size.height = winWidth * imageSize.height /imageSize.width;
                }else{
                    rect.size.width = imageSize.width;
                    rect.size.height = imageSize.height;
                }
                self.imageView.frame = rect;
                tableData.rect = rect;
                tableData.height = rect.size.height + 20;
                NSLog(@"%f",tableData.height);
                block();
            });
        });
    }
}

@end
