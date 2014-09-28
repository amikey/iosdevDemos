//
//  CoordinateScene.h
//  stepbystep
//
//  Created by 侯 坤明 on 14-8-24.
//
//

#ifndef __stepbystep__CoordinateScene__
#define __stepbystep__CoordinateScene__

#include "cocos2d.h"

class CoordinateScene:public cocos2d::Layer
{
public:
    static cocos2d::Scene *createScene();
    virtual bool init();
    
    CREATE_FUNC(CoordinateScene);

private:
    
    void goback(Ref *sender);
    
    
};

#endif /* defined(__stepbystep__CoordinateScene__) */
