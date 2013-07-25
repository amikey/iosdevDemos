//
//  CollectionController.m
//  CollectionView
//
//  Created by 侯 坤明 on 13-7-9.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "CollectionController.h"
#import "CollectionViewCell.h"

@interface CollectionController ()
@property (nonatomic) NSArray *imgList;
@property (nonatomic) NSInteger selectedCellNum;
@property (strong, nonatomic) MediaFocusManager *mediaFocusManager;
@end

@implementation CollectionController
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.imgList = @[
                     @"http://jiuzhaigou.xiyoutrip.com/uploads/arcimgs/130312132241_718751_co5jzrhot6ps.jpg",
                     @"http://www.bz55.com/uploads/allimg/110910/1A40L0U-12.jpg",
                     @"http://abc.2008php.com/2011_Website_appreciate/11-04-29/20110429160012.jpg",
                     @"http://img.bz1111.com/d4/2011-7/2011071909282.jpg",
                     @"http://www.51766.com/img/cover/1347603536335.jpg",
                     @"http://pic1.win4000.com/wallpaper/4/4ff2b6bd4efcc.jpg",
                     @"http://www.bz55.com/uploads1/allimg/100703/101022CD-6.jpg",
                     @"http://pic1.win4000.com/wallpaper/a/4fceb23c1312d.jpg",
                     
                     @"http://img3.cache.netease.com/photo/0026/2013-06-28/900x600_92ES6H5B4CJ80026.jpg",
                     @"http://img4.cache.netease.com/photo/0031/2013-07-09/900x600_93CCVDMU43UD0031.jpg",
                     @"http://img6.cache.netease.com/photo/0031/2013-07-09/900x600_93CCVD6P43UD0031.jpg",
                     @"http://img6.cache.netease.com/photo/0031/2013-07-09/900x600_93CCVAJB43UD0031.jpg"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.mediaFocusManager = [[MediaFocusManager alloc] init];
    self.mediaFocusManager.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - collection delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.imgList count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imgCollectionCell" forIndexPath:indexPath];
    [self updateCell:cell atIndex:indexPath];
    return cell;
}

-(void)updateCell:(UICollectionViewCell *)cell atIndex: (NSIndexPath *) index
{
    if([cell isKindOfClass:[CollectionViewCell class]]){
        NSString *url = [self.imgList objectAtIndex:index.row];
        ((CollectionViewCell *)cell).url = url;
    }

}
#pragma mark - custom method
- (IBAction)clickCell:(UITapGestureRecognizer *)gesture
{
    //NSLog(@"%@",((UIImageView *)[gesture view]).image);
    CGPoint tapLocation = [gesture locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:tapLocation];
    if(indexPath)
    {
        self.selectedCellNum = indexPath.row;
        [self showBigImg:[self.imgList objectAtIndex:self.selectedCellNum]];
    }
    //[self performSegueWithIdentifier:@"showBigImgSegue" sender:self];
}

-(void)showBigImg: (NSString *)urlStr
{
    [self.mediaFocusManager showBigImageWithURL:urlStr inView:self];
}
#pragma mark - MediaFocusDelegate
-(UIViewController *)parentViewControllerForView:(MediaFocusManager *)mediaFocusManager
{
    return self;
}
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if([segue.identifier isEqualToString:@"showBigImgSegue"])
//    {
//        BigImgViewControler *bigImgVIew = [segue destinationViewController];
//        NSString *urlStr = [NSString  stringWithFormat:@"https://raw.github.com/ShadoFlameX/PhotoCollectionView/master/Photos/thumbnail%d.jpg", self.selectedCellNum];
//        NSLog(urlStr);
//        bigImgVIew.imgUrl = urlStr;
//    }
//}

@end
