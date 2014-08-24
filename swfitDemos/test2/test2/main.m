//
//  main.m
//  test2
//
//  Created by 侯 坤明 on 14-7-1.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        NSDate *d1 = [NSDate dateWithString:@"1983-10-25 12:33:33"];
        
        NSDate *now = [NSDate date];
        
        NSDate *a = [NSDate dateWithTimeIntervalSinceNow:[d1 timeIntervalSince1970]];
        
        NSDate *d2 = [NSDate dateWithTimeIntervalSince1970:435859200];
        
        float dd = [now timeIntervalSince1970] - 435859200.00;
        
        NSString *astroStr = @"魔羯水瓶双鱼牡羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
        NSArray *arr = @[@20,@19,@21,@21,@21,@22,@23,@23,@23,@23,@22,@22];
       
        NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:d2];
        
        int year = [components year];
        int month = [components month];
        int day = [components day];
        
        NSRange range = NSMakeRange(month * 2 - (day < [arr[month - 1] intValue] ? 2 : 0), 2);
        NSString *astro = [astroStr substringWithRange: range];
 
        
        NSLog(@"%f", dd / (24 * 3600 * 365));
    }
    return 0;
}


    
   // .substr(month*2-(day<arr[month-1]?2:0),2);

