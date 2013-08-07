//
//  LabelLayer.m
//  qz_tableView_demo
//
//  Created by 侯 坤明 on 13-8-2.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "LabelLayer.h"

@implementation LabelLayer

-(id)initWithDictionary: (NSMutableDictionary *) map
{
    NSNull *null = [NSNull null];
    self.type = @"text";
    if((NSNull *)[map objectForKey:@"fontFamily"] == null){
        [map setObject:@"arial" forKey: @"fontFamily"];
    }
    if((NSNull *)[map objectForKey:@"fontSize"] == null){
        [map setObject:[NSNumber numberWithInt:14] forKey: @"fontSize"];
    }
    self.font = [UIFont fontWithName:[map objectForKey:@"fontFamily"] size: [(NSNumber *)[map objectForKey:@"fontSize"] floatValue]];
    
    NSArray *fontColor = (NSArray *)[map objectForKey: @"fontColor"];
    if((NSNull *)fontColor != null){
        self.fontColor = [UIColor colorWithRed:[(NSNumber *)[fontColor objectAtIndex:0] floatValue]/255.0  green:[(NSNumber *)[fontColor objectAtIndex:1] floatValue]/255.0 blue:[(NSNumber *)[fontColor objectAtIndex:2] floatValue]/255.0 alpha:[(NSNumber *)[fontColor objectAtIndex:3] floatValue]];
    }
    id bgColor = [map objectForKey: @"bgColor"];
    if(bgColor == null){
        self.bgColor = [UIColor clearColor];
    }else{
        self.bgColor = [UIColor colorWithRed:[(NSNumber *)[bgColor objectAtIndex:0] floatValue]/255.0  green:[(NSNumber *)[bgColor objectAtIndex:1] floatValue]/255.0 blue:[(NSNumber *)[bgColor objectAtIndex:2] floatValue]/255.0 alpha:[(NSNumber *)[bgColor objectAtIndex:3] floatValue]];
    }
    if([map objectForKey: @"align"] != null){
        self.align = (UITextAlignment)[(NSNumber *)[map objectForKey: @"align"] intValue];
    }else{
        self.align = UITextAlignmentLeft;
    }
    if([map objectForKey: @"lineBreakMode"] != null){
        self.lineBreakMode = (UILineBreakMode)[(NSNumber *)[map objectForKey: @"lineBreakMode"] intValue];
    }else{
        self.lineBreakMode = UILineBreakModeClip;
    }
    if([map objectForKey: @"rect"] != null){
        self.rect = [[map objectForKey: @"rect"] CGRectValue];
    }
    return self;
}

-(void)draw
{
    if((NSNull *)self.text != [NSNull null]){
        if(self.fontColor != nil){
            [self.fontColor setFill];
        }
        [self.text drawInRect:self.rect withFont:self.font lineBreakMode:self.lineBreakMode alignment:self.align];
    }
}
@end
