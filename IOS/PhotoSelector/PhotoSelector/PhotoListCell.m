//
//  PhotoListCell.m
//  PhotoSelector
//
//  Created by 侯 坤明 on 13-9-16.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "PhotoListCell.h"
#import "AssetsLibrary/AssetsLibrary.h"
#import "PhotoItemView.h"
#import "PhotoInfoModel.h"

@interface PhotoListCell()<PhotoItemViewDelegate>
@property (strong, nonatomic) NSArray *imageViewList;

@end

@implementation PhotoListCell

- (void)renderWithData: (NSArray *)photos
{
    for(int i = 0; i < self.imageViewList.count; i++){
        PhotoItemView *item = ((PhotoItemView *)[self.imageViewList objectAtIndex:i]);
        if(i < photos.count) {
            PhotoInfoModel *photo = [photos objectAtIndex:i];
            item.status = _status;
            item.photoInfo = photo;
            item.rowNumber = self.rowNumber;
            item.hidden = NO;
            NSLog(@"%d行%d列，ischecked: %@", self.rowNumber,i, photo.isChecked ? @"YES":@"NO");
        }else{
            item.hidden = YES;
        }
    }
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.imageViewList = [NSArray arrayWithObjects:
                              [[PhotoItemView alloc] initWithFrame:CGRectMake(5, 5, 100, 100)],
                              [[PhotoItemView alloc] initWithFrame:CGRectMake(110, 5, 100, 100)],
                              [[PhotoItemView alloc] initWithFrame:CGRectMake(215, 5, 100, 100)], nil];
        for(int i = 0; i < self.imageViewList.count; i++){
            PhotoItemView *item = (PhotoItemView *)[self.imageViewList objectAtIndex:i];
            item.index = i;
            item.rowNumber = self.rowNumber;
            item.delegate = self;
            [self addSubview: [self.imageViewList objectAtIndex:i]];
        }
    }
    return self;
}

#pragma mark photoItemViewDelegate
- (void)photoItemClicked:(PhotoItemView *)sender
{
    int index = sender.index + self.rowNumber * 3;
    if(self.delegate && [self.delegate respondsToSelector:@selector(photoClicked:sender:)]){
        [self.delegate photoClicked:index sender: (id)sender];
    }
}
@end
