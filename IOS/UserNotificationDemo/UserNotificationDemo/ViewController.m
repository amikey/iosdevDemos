//
//  ViewController.m
//  UserNotificationDemo
//
//  Created by 侯 坤明 on 14-6-19.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
    category.identifier = @"CUSTOM_NOFITY_CATEGORY";
    
    UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc] init];
    action1.identifier = @"NOTIFY_LIKE";//可用于appdelegate中捕获事件 handleActionWithIdentifier
    action1.title = @"赞";//按钮title
    action1.activationMode = UIUserNotificationActivationModeBackground;//APP运行方式, 后台则不呼起到前台
    
    
    UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];
    action2.identifier = @"NOTIFY_REPLY";
    action2.title = @"回复";
    action2.activationMode = UIUserNotificationActivationModeForeground;
    action2.destructive = YES;//YES时在notification center中左划出现的按钮为红色, 意为提醒用户此操作可能是具破坏性的
    
    [category setActions: @[action1, action2] forContext:UIUserNotificationActionContextMinimal];
    
    NSSet *set = [NSSet setWithObjects:category, nil];
    
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:set];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    
}

- (IBAction)addNotify:(id)sender {
    UILocalNotification *notification=[[UILocalNotification alloc] init];
    if (notification!=nil) {

        notification.category = @"CUSTOM_NOFITY_CATEGORY";
        
        NSDate *now=[NSDate new];
        notification.fireDate = [now dateByAddingTimeInterval:6]; //触发通知的时间
        notification.repeatInterval=0; //循环次数，kCFCalendarUnitWeekday一周一次
        
        notification.timeZone=[NSTimeZone defaultTimeZone];
        notification.soundName = UILocalNotificationDefaultSoundName;
        notification.alertBody=@"你收到一个通知.......！";
        
        notification.alertAction = @"打开";  //提示框按钮
        notification.hasAction = YES; //是否显示额外的按钮，为no时alertAction消失
        
        notification.applicationIconBadgeNumber = 1; //设置app图标右上角的数字
        
        //下面设置本地通知发送的消息，这个消息可以接受
        NSDictionary* infoDic = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
        notification.userInfo = infoDic;
        //发送通知
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
