//
//  MyScene.m
//  helloworld
//
<<<<<<< HEAD
//  Created by 侯 坤明 on 13-10-18.
=======
//  Created by 侯 坤明 on 13-10-21.
>>>>>>> c33b6040bd0897a4848160cf13637aacfff477f7
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
<<<<<<< HEAD
=======
        
        
>>>>>>> c33b6040bd0897a4848160cf13637aacfff477f7
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
<<<<<<< HEAD
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImageNamed:@"Spacesship"]
                                                              size:CGSizeMake(50, 50)];
        
        sprite.position = location;
        sprite.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:sprite.size];
        
        SKAction *action = [SKAction sequence:@[
                                                [SKAction moveByX:0 y:100 duration:0.5]
                                                ]];
        
        [sprite runAction:action];
=======
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction sequence:@[
                                                [SKAction moveByX:500 y:20 duration:1],
                                                [SKAction moveByX:20 y:300 duration:1]
                                                ]];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
>>>>>>> c33b6040bd0897a4848160cf13637aacfff477f7
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
