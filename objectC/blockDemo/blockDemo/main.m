//
//  main.m
//  blockDemo
//
//  Created by 侯 坤明 on 13-7-25.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        //第一种申明方式，先申明一个block 的type
        typedef float (^block_custom_t)(float num1, float num2);
        block_custom_t block;
        block = ^(float num1, float num2){
            return num1 * num2;
        };
        NSLog([NSString stringWithFormat:@"block1 result is %f", block(2.2, 3.2)]);
        
        //第二种直接申明一个block
        float (^block2)(float num1, float num2) = ^(float num1, float num2){
            return num1 / num2;
        };
        NSLog([NSString stringWithFormat:@"block2 result is %f", block2(3, 2)]);
        
        //第三种直接使用
        NSLog([NSString stringWithFormat:@"block3 result is %.2f", ^(float num1, float num2){
            return num2 / num1;
        }(10, 2)]);
        
    }
    return 0;
}


