//
//  MessageListView.m
//  BlueTooth
//
//  Created by 侯 坤明 on 13-12-18.
//  Copyright (c) 2013年 SAGO. All rights reserved.
//

#import "MessageListView.h"

@implementation MessageListView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _currentY = 5;
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)addMessage: (NSString *)msg from: (FROM_TYPE)fromType
{
    if(msg){
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.text = msg;
        [label sizeToFit];
        CGRect fram = label.frame;
        fram.origin.x = fromType == FROM_FRIEND ? 5 : SCREEN_W - label.bounds.size.width - 5;
        fram.origin.y = _currentY;
        label.frame = fram;
        [self addSubview:label];
        _currentY += 25;
        self.contentSize = CGSizeMake(SCREEN_W, _currentY);
        [self scrollToBottom];
    }
}

- (void)scrollToBottom
{
    [self setContentOffset:CGPointMake(0, _currentY - self.bounds.size.height) animated:NO];
}

@end
