//
//  CoordinateScene.cpp
//  stepbystep
//
//  Created by 侯 坤明 on 14-8-24.
//
//

#include "CoordinateScene.h"
USING_NS_CC;

Scene *CoordinateScene::createScene()
{
    auto scene = Scene::create();
    
    auto layer = CoordinateScene::create();
    scene->addChild(layer);
    
    return scene;
}

bool CoordinateScene::init()
{
    if(!Layer::init()){
        return false;
    }
    
    Size visibleSize = Director::getInstance()->getVisibleSize();
    
    CCLayerColor *bg = CCLayerColor::create(ccc4(10, 10, 100, 255), visibleSize.width, visibleSize.height);
    bg->setPosition(Vec2(0,0));
    this->addChild(bg);
    
    Label *label = Label::create("go back", "Arial", 32);
    MenuItemLabel *backLable = MenuItemLabel::create(label, CC_CALLBACK_1(CoordinateScene::goback, this));
    backLable->setPosition(Vec2(100, 500));
    auto backMenu = Menu::createWithItem(backLable);
    backMenu->setPosition(Vec2::ZERO);
    this->addChild(backMenu);
    
    return true;
}

void CoordinateScene::goback(Ref *sender)
{
    Director::getInstance()->popScene();
}