//
//  AssetsLibraryManager.m
//  LBSPhotoSelector
//
//  Created by 侯 坤明 on 13-9-23.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "AssetsLibraryManager.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <LBSSDK/QLBSService.h>
#import "AlbumModel.h"
#import "PhotoInfoModel.h"

static const AssetsLibraryManager *_sharedInstance;

@interface AssetsLibraryManager(){
    NSMutableDictionary *_albumMap;
    NSMutableDictionary *_photoMap;
}

@end

@implementation AssetsLibraryManager
+ (id)sharedInstance
{
    if(!_sharedInstance){
        @synchronized(self){
            _sharedInstance = [[AssetsLibraryManager alloc] init];
        }
    }
    return _sharedInstance;
}

- (id)init
{
    if(self = [super init]){
        _albumList = [NSMutableArray array];
        _albumMap = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)initAlbumData: (void(^)())callback
{
    [self getAssetsGroup:^(BOOL success) {
        callback();
    }];
}

- (void)initLBSPhotsGroups: (void(^)())callback
{
    
}

- (void)getAllPhotos: (void(^)())callback
{
    
}

- (void)loadAlbumPhotos: (ALAssetsGroup *)assetsGroup
{
    [assetsGroup enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if(result){
            PhotoInfoModel *photo = [[PhotoInfoModel alloc] init];
            photo.uid = [result valueForProperty:ALAssetPropertyAssetURL];
        }
    }];
}

- (void)getAssetsGroup: (void(^)(BOOL success))callback
{
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [_albumMap removeAllObjects];
    [_albumList removeAllObjects];
    [library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if(group){
            AlbumModel *album = [[AlbumModel alloc] init];
            album.name = [group valueForProperty:ALAssetsGroupPropertyName];
            album.id = [group valueForProperty:ALAssetsGroupPropertyPersistentID];
            album.photoCount = [group numberOfAssets];
            album.posterCGImage = [group posterImage];
            [_albumMap setObject:album forKey:album.id];
            [_albumList addObject: album];
        }else{
            callback(YES);
        }
    } failureBlock:^(NSError *error) {
        assert(0);
    }];
}

- (void)getPhotoLBSInfo: (PhotoInfoModel *)photo
{
    
}
@end
