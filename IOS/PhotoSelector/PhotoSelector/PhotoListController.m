//
//  PhotoListController.m
//  PhotoSelector
//
//  Created by 侯 坤明 on 13-9-16.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "PhotoListController.h"
#import "PhotoListCell.h"
#import "PhotoInfoModel.h"
#import "CommonDefine.h"
#import "PhotoDetailView.h"
#import "PhotoItemView.h"

@interface PhotoListController()<UITableViewDataSource, UITableViewDelegate, PhotoListCellDelegate>
{
    UIBarButtonItem *rightButton;
    PhotoDetailView *photoDetailView;
    UIImageView *animateImageView;
}
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *photoList;
@property (nonatomic) P_STATUS status;
@end

@implementation PhotoListController

- (id)init
{
    if(self = [super init]){
        self.photoList = [NSMutableArray array];
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.separatorColor = [UIColor clearColor];
        [self.view addSubview:self.tableView];
        rightButton = [[UIBarButtonItem alloc] initWithTitle:@"选择" style:UIBarButtonItemStyleBordered target:self action:@selector(selectStatus:)];
        self.navigationItem.rightBarButtonItem = rightButton;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = [_assetsGroup valueForProperty:ALAssetsGroupPropertyName];
    [_assetsGroup setAssetsFilter:[ALAssetsFilter allPhotos]];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.photoList removeAllObjects];
    [_assetsGroup enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if(result){
            
            PhotoInfoModel *model = [[PhotoInfoModel alloc] init];
            model.cgImage = CGImageCreateCopy([result thumbnail]);
            model.representation = [result defaultRepresentation];
            model.date = [result valueForProperty:ALAssetPropertyDate];
            model.location = [result valueForProperty:ALAssetPropertyLocation];
            [self.photoList addObject:model];
        }else{
            [self.tableView reloadData];
        }
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _tableView.frame = self.view.bounds;
}

- (void)selectStatus: (id)sender
{
    if(self.status == NORMAL){
        self.status = SELECTING;
        [rightButton setTitle:@"取消"];
    }else{
        self.status = NORMAL;
        [rightButton setTitle:@"选择"];
        for(int i = 0; i < self.photoList.count; i++){
            ((PhotoInfoModel *)[self.photoList objectAtIndex:i]).isChecked = NO;
        }
    }
    [self.tableView reloadData];
}

- (void)showPhotoDetailView: (int)index sender:(id)sender
{
    PhotoInfoModel *photo = (PhotoInfoModel *)[_photoList objectAtIndex:index];
    if(!photoDetailView){
        photoDetailView = [[PhotoDetailView alloc] init];
    }
    if(!animateImageView){
        animateImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:animateImageView];
    }
    PhotoItemView *clickedImageView = (PhotoItemView *)sender;
    PhotoListCell *cellView = (PhotoListCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:clickedImageView.rowNumber inSection:0]];
    CGRect imageFrame = clickedImageView.frame;
    CGRect newRect = [cellView convertRect:imageFrame toView:self.view];
    animateImageView.frame = newRect;
    animateImageView.image = [UIImage imageWithCGImage: clickedImageView.photoInfo.cgImage];
    animateImageView.hidden = NO;
    
    [UIView animateWithDuration:0.5 animations:^{
        animateImageView.frame = self.view.bounds;
    } completion:^(BOOL finished) {
        photoDetailView.image = nil;
        photoDetailView.image = [UIImage imageWithCGImage: photo.representation.fullScreenImage];
        photoDetailView.modalPresentationStyle = UIModalPresentationFullScreen;
        photoDetailView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self.navigationController presentViewController:photoDetailView animated:YES completion:^{
            animateImageView.hidden = YES;
        }];
    }];
}

#pragma mark PhotoListCellDelegate
- (void)photoClicked:(int)index sender: (id)sender
{
    NSLog(@"photo clicked : %d, isChecked: %@", index, ((PhotoInfoModel *)[_photoList objectAtIndex:index]).isChecked ? @"YES" : @"NO");
    if(self.status == NORMAL){
        [self showPhotoDetailView: index sender:sender];
    }
}

#pragma mark tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ceil(self.photoList.count / 3.0f);
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[PhotoListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    cell.status = _status;
    cell.rowNumber = indexPath.row;
    NSMutableArray *arr = [NSMutableArray array];
    int start = indexPath.row * 3;
    for(int i = 0; i < 3; i++){
        if(start + i < self.photoList.count){
            [arr addObject: [self.photoList objectAtIndex:start + i]];
        }
    }
    [cell renderWithData: arr];
    return cell;
}


@end
