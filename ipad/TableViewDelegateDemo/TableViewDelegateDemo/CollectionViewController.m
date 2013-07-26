//
//  CollectionViewController.m
//  TableViewDelegateDemo
//
//  Created by 侯 坤明 on 13-7-25.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //self.collectionView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//CollectionViewController继承自UICollectionViewController, 同时也继承了他的protocol

//有两个必须的跟UITableView的protocol类似
//protocol - dataSource - 项目数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}
//返回item
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //根据Identifier来复制现有的cell得到新cell
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCollectionViewCell" forIndexPath:indexPath];
    //如果是第一个item则为空, 需要实例化一个
    if(cell == nil)
    {
        cell = [[UICollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    }
    return cell;
}

@end
