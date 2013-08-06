//
//  AsyncImage.m
//  NavigationController
//
//  Created by 侯 坤明 on 13-8-5.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "AsyncImage.h"
#import "DeallocTest.h"

@implementation AsyncImage
-(id)init
{
    return self;
}

//正确的block方案，不会出现内存泄漏风险
-(void)loadImageWithUrl: (NSString *)urlstr{
    dispatch_queue_t queue = dispatch_queue_create("load image", nil);
    //这里测试block对外部静态变量的引用方式，未加__block前缀的val在block中实际是复制了一份它的值且只读，在block后面修改值后在block内是不生效的
    //加了__block前缀后实为一个指针，在block中可以修改其值，block外部修改值也能同步到block中
    int val = 10;
    __block int val2 = 10;
    
    __weak DeallocTest *_view_temp = [[DeallocTest alloc] init];
    __weak AsyncImage *tmp = self;
    dispatch_async(queue, ^{

        NSLog(@"begin load image");
        sleep(2);
        NSLog(@"DeallocTest is : %@", _view_temp);
        sleep(2);
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlstr]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"val is : %d", val);
            NSLog(@"val2 is : %d", val2);
            val2 = 30;
            NSLog(@"val2 changed in block is : %d", val2);
            NSLog(@"self tmp is: %@", tmp);
            if(tmp != nil && tmp.delegate != nil){
                [tmp.delegate loadedImage:image];
            }
        });
    });
    val = 20;
    val2 = 20;
}

//错误的方案，没有使用weak前缀，容易出现内存泄漏
-(void)wrongBlock_loadImageWithUrl: (NSString *)urlstr
{
    dispatch_queue_t queue = dispatch_queue_create("load image", nil);
    DeallocTest *_view_temp = [[DeallocTest alloc] init];
    
    //这里block 里面用到两个外面的变量：_view_temp 和 self, 这两个要释放必须等到block执行完成才能进行
    
    dispatch_async(queue, ^{
        NSLog(@"begin load image");
        sleep(3);
        NSLog(@"DeallocTest is : %@", _view_temp);
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlstr]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"wrong block's self is: %@, self.delegate is %@", self, self.delegate);
            if(self.delegate != nil){
                [self.delegate loadedImage:image];
            }
        });
    });
}

//assign类型的delegate处理不当容易产生野指针crash
-(void)assignDelegate_wrong_loadImageWithUrl: (NSString *)urlstr
{
    dispatch_queue_t queue = dispatch_queue_create("load image", nil);
    DeallocTest *_view_temp = [[DeallocTest alloc] init];
    
    //self.assignDelegate 在block未执行就被释放的时候，其就成为了野指针，直接crash了
    
    dispatch_async(queue, ^{
        NSLog(@"begin load image");
        sleep(3);
        NSLog(@"DeallocTest is : %@", _view_temp);
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlstr]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"wrong block's self is: %@, self.delegate is %@", self, self.assignDelegate);
            if(self.assignDelegate != nil){
                [self.assignDelegate loadedImage:image];
            }
        });
    });
}

//强制把assign类型的delegate转换成weak解决野指针问题
-(void)assignDelegate_changeToWeak_loadImageWithUrl: (NSString *)urlstr
{
    dispatch_queue_t queue = dispatch_queue_create("load image", nil);
    __weak DeallocTest *_view_temp = [[DeallocTest alloc] init];
    
    //强制转换成weak
    __weak id<AsyncImage> _assignDelegate = self.assignDelegate;
        
    dispatch_async(queue, ^{
        NSLog(@"begin load image");
        sleep(3);
        NSLog(@"DeallocTest is : %@", _view_temp);
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlstr]]];
        dispatch_async(dispatch_get_main_queue(), ^{
           NSLog(@"change to weak assign delegate is: %@", _assignDelegate);
            if(_assignDelegate != nil){
                [_assignDelegate loadedImage:image];
            }
        });
    });
}

-(void)dealloc
{
    NSLog(@"Async Page dealloc called");
}
@end
