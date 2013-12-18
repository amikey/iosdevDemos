//
//  BlueToothRootViewController.h
//  BlueTooth
//
//  Created by 侯 坤明 on 13-12-13.
//  Copyright (c) 2013年 SAGO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

@interface BlueToothRootViewController : UIViewController
- (void)connect;
- (void)sendDataToAllPeer: (NSData *)data;
@end
