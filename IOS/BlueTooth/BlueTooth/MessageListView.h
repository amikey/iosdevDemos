//
//  MessageListView.h
//  BlueTooth
//
//  Created by 侯 坤明 on 13-12-18.
//  Copyright (c) 2013年 SAGO. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

typedef enum{
    FROM_FRIEND,
    FROM_ME
}FROM_TYPE;

@interface MessageListView : UIScrollView{
    CGFloat _currentY;
}

- (void)addMessage: (NSString *)msg from: (FROM_TYPE)fromType;
- (void)scrollToBottom;
@end
