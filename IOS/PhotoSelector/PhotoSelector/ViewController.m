//
//  ViewController.m
//  PhotoSelector
//
//  Created by 侯 坤明 on 13-9-16.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "AssetsLibrary/AssetsLibrary.h"
#import "AlbumListCell.h"
#import "PhotoListController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    ALAssetsLibrary *assetsLibrary;
}
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *albumList;
@property (strong, nonatomic) NSMutableArray *assetsGroupList;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.albumList = [NSMutableArray array];
    self.assetsGroupList = [NSMutableArray array];
    self.tableView = [[UITableView alloc] initWithFrame: self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self loadAlbumList];
}

- (void)loadAlbumList
{
    ALAssetsLibraryGroupsEnumerationResultsBlock groupsEnumeration = ^(ALAssetsGroup *group, BOOL *stop){
        if(group){
            AlbumModel *model = [[AlbumModel alloc] init];
            model.name = [group valueForProperty:ALAssetsGroupPropertyName];
            model.photoCount = [group numberOfAssets];
            model.posterImage = [UIImage imageWithCGImage:[group posterImage]];
            
            [self.albumList addObject:model];
            [self.assetsGroupList addObject:group];
        }else{
            [self.tableView reloadData];
        }
    };
    
    assetsLibrary = [[ALAssetsLibrary alloc] init];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:groupsEnumeration failureBlock:^(NSError *error) {
        NSLog(@"error: %@", error);
        assert(0);
    }];
}

#pragma mark tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.albumList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AlbumListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[AlbumListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    [cell renderWithGroupinfo: [self.albumList objectAtIndex:indexPath.row]];
    return cell;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ALAssetsGroup *group = [self.assetsGroupList objectAtIndex:indexPath.row];
    PhotoListController *controller = [[PhotoListController alloc] init];
    controller.assetsGroup = group;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
