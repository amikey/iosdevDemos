//
//  AlbumListCell.m
//  PhotoSelector
//
//  Created by 侯 坤明 on 13-9-16.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "AlbumListCell.h"

@interface AlbumListCell()


@end

@implementation AlbumListCell{
    UIImageView *thumbImageView;
    UILabel *titleLabel;
    UILabel *countLabel;
}

- (void)renderWithGroupinfo: (AlbumModel *)album
{
    titleLabel.text = album.name;
    [titleLabel sizeToFit];
    countLabel.text = [NSString stringWithFormat:@"相片数：%d", album.photoCount];
    [countLabel sizeToFit];
    thumbImageView.image = album.posterImage;
    NSLog(@"rendered : %@", album.name);
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.frame = CGRectMake(0, 0, 320, 100);
        thumbImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        thumbImageView.image = [UIImage imageNamed:@"Default.png"];
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 0, 0)];
        countLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 60, 0, 0)];
        countLabel.font = [countLabel.font fontWithSize:12];
        countLabel.textColor = [UIColor grayColor];
        [self addSubview:thumbImageView];
        [self addSubview:titleLabel];
        [self addSubview:countLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
