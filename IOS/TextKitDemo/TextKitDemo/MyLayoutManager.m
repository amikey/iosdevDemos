//
//  MyLayoutManager.m
//  TextKitDemo
//
//  Created by 侯 坤明 on 14-8-14.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "MyLayoutManager.h"

@implementation MyLayoutManager

- (void)drawUnderlineForGlyphRange:(NSRange)glyphRange
                     underlineType:(NSUnderlineStyle)underlineVal
                    baselineOffset:(CGFloat)baselineOffset
                  lineFragmentRect:(CGRect)lineRect
            lineFragmentGlyphRange:(NSRange)lineGlyphRange
                   containerOrigin:(CGPoint)containerOrigin
{
    //[super drawUnderlineForGlyphRange:glyphRange underlineType:underlineVal baselineOffset:baselineOffset lineFragmentRect:lineRect lineFragmentGlyphRange:lineGlyphRange containerOrigin:containerOrigin];
    // Left border (== position) of first underlined glyph
    CGFloat firstPosition = [self locationForGlyphAtIndex: glyphRange.location].x;
    
    // Right border (== position + width) of last underlined glyph
    CGFloat lastPosition;
    
    // When link is not the last text in line, just use the location of the next glyph
    if (NSMaxRange(glyphRange) < NSMaxRange(lineGlyphRange)) {
        lastPosition = [self locationForGlyphAtIndex: NSMaxRange(glyphRange)].x;
    }
    // Otherwise get the end of the actually used rect
    else {
        lastPosition = [self lineFragmentUsedRectForGlyphAtIndex:NSMaxRange(glyphRange)-1 effectiveRange:NULL].size.width;
    }
    
    // Inset line fragment to underlined area
    lineRect.origin.x += firstPosition;
    lineRect.size.width = lastPosition - firstPosition;
    
    // Offset line by container origin
    lineRect.origin.x += containerOrigin.x;
    lineRect.origin.y += containerOrigin.y;
	// Align line to pixel boundaries, passed rects may be
	lineRect = CGRectInset(CGRectIntegral(lineRect), .5, .5);
    
    [[UIColor blueColor] set];
    [[UIBezierPath bezierPathWithOvalInRect:lineRect] stroke];
}

- (void)drawBackgroundForGlyphRange:(NSRange)glyphsToShow atPoint:(CGPoint)origin
{
    //[super drawBackgroundForGlyphRange:glyphsToShow atPoint:origin];
    
    
}


@end
