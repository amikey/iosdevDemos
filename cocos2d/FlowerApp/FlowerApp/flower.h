//
//  Flower.h
//  FlowerApp
//
//  Created by 侯 坤明 on 13-7-1.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// Flower
@interface flower : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
}

// returns a CCScene that contains the Flower as the only child
+(CCScene *) scene;

@end
