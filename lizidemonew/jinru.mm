//
//  jinru.cpp
//  lizidemonew
//
//  Created by gq on 12-12-7.
//
//

#include "jinru.h"
#include "HelloWorldScene.h"
#include "GameKitHelper.h"

#include "goumaign.h"

using namespace cocos2d;
using namespace CocosDenshion;

CCScene* jinru::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();

    // 'layer' is an autorelease object
    jinru *layer = jinru::create();

  
    // add layer as a child to scene
    scene->addChild(layer);
    
    // return the scene
    return scene;
}

bool jinru::init()
{
    if ( !CCLayer::init() )
    {
        return false;
    }
    
        screensize=CCDirector::sharedDirector()->getWinSize();
    CCParticleSystem *_xingxing=CCParticleSystemQuad::create("ss.plist");
    _xingxing->setAutoRemoveOnFinish(true);
    _xingxing->setPosition(ccp(screensize.width*0.5,screensize.height*0.5));
    this->addChild(_xingxing);
    CCSprite *_backgrounds=CCSprite::create("3.jpg");
    _backgrounds->setPosition(ccp(screensize.width/2,screensize.height/2));
    this->addChild(_backgrounds);
    SimpleAudioEngine::sharedEngine()->playBackgroundMusic("main.mp3", true);
    fontSize=24*screensize.height/320;
    //显示开始菜单背景
    CCSprite *_startSp=CCSprite::create("jinru_2.png");
    CCSprite *_startSpjg=CCSprite::create("jinru_2.png");
    _startSpjg->setColor(ccc3(0, 255, 25));
    CCMenuItemSprite *itemspr=CCMenuItemSprite::create(_startSp, _startSpjg,this, menu_selector(jinru::qiehuan));
      itemspr->setPosition(ccp(screensize.width/2,screensize.height*0.7));
        //显示开始菜单文字
                 CCLabelTTF *startGameFF=CCLabelTTF::create("Start  Game", "Helvetica-Bold", fontSize);
        CCMenuItemLabel *_startGameF=CCMenuItemLabel::create(startGameFF);
    
       _startGameF->setPosition(ccp(screensize.width/2,screensize.height*0.7));
     //显示排行榜图片
    CCSprite *_paiHSp=CCSprite::create("jinru_3.png");
    CCSprite *_startpaiHSpjg=CCSprite::create("jinru_3.png");
     _startpaiHSpjg->setColor(ccc3(0, 255, 25));
    CCMenuItemSprite *itemsprpaiH=CCMenuItemSprite::create(_paiHSp, _startpaiHSpjg, this, menu_selector(jinru::showPaihangbang));
   itemsprpaiH->setPosition(ccp(screensize.width/2,screensize.height*0.5));

    //显示排行榜文字

//  NSString *_str=NSLocalizedStringFromTable(@"paihangbang",@"MiracleInternation", nil);
//    NSString *_str=@"rank";
//    
//
//    const char *color_char1 = [_str cStringUsingEncoding:NSASCIIStringEncoding];
    
    CCLabelTTF*_paihangFF=CCLabelTTF::create((jinru::getStringByKey("paihangbang")), "Helvetica-Bold",fontSize);
    CCMenuItemLabel *_paihangF=CCMenuItemLabel::create(_paihangFF);
     _paihangF->setPosition(ccp(screensize.width/2,screensize.height*0.5));
 //显示购买图片
    CCSprite *_BuySp=CCSprite::create("jinru_3.png");
    CCSprite *_BuyHSpjg=CCSprite::create("jinru_3.png");
        _BuyHSpjg->setColor(ccc3(0, 255, 25));
    CCMenuItemSprite *itemsprBuy=CCMenuItemSprite::create(_BuySp, _BuyHSpjg, this, menu_selector(jinru::qiehuangoumai));
   itemsprBuy->setPosition(ccp(screensize.width/2,screensize.height*0.3));
    //显示购买
    
//    NSString *_strss=NSLocalizedStringFromTable(@"goumai",@"MiracleInternation", nil);
//    
//    const char *color_chars2 = [_strss cStringUsingEncoding:NSASCIIStringEncoding];
    CCLabelTTF *buyFF=CCLabelTTF::create((jinru::getStringByKey("goumai")), "Helvetica-Bold", fontSize);
    CCMenuItemLabel *_buyGameF=CCMenuItemLabel::create(buyFF);
    
    _buyGameF->setPosition(ccp(screensize.width/2,screensize.height*0.3));
    //全部菜单
    CCMenu *_startGameM=CCMenu::create(itemspr,_startGameF,itemsprpaiH,_paihangF,itemsprBuy,_buyGameF,NULL);
    _startGameM->setPosition(ccp(0,0));
    this->addChild(_startGameM);

    
    //免费游戏开始菜单
//     startGameFF_an=CCLabelTTF::create("Start  Game", "Helvetica-Bold", fontSize);
//        startGameFF_an->setVisible(false);
//    CCCallFuncN *_funn=CCCallFuncN::create(this, callfuncN_selector(jinru::showStart));
//    startGameFF_an->runAction(CCSequence::create(CCDelayTime::create(5),_funn,NULL));
//
//    CCMenuItemLabel *_startGameF_an=CCMenuItemLabel::create(startGameFF_an, this, menu_selector(jinru::qiehuan));
//    
//    _startGameF_an->setPosition(ccp(screensize.width/2,screensize.height*0.3));
//    
//    CCMenu *_startGameM_an=CCMenu::create(_startGameF_an,NULL);
//    _startGameM_an->setPosition(ccp(0,0));
//    this->addChild(_startGameM_an);

    

    
          return true;
     
   
}

void jinru::showStart(CCObject* pSender)
{
    
     startGameFF_an->setVisible(true);
    
}
void jinru::showPaihangbang(cocos2d::CCObject *pSender)
{
    [[GameKitHelper sharedGameKitHelper] showLeaderboard];
  
    
}
void jinru::qiehuan(CCObject* pSender)
{
    SimpleAudioEngine::sharedEngine()->playEffect("btn.mp3");
    CCDirector::sharedDirector()->replaceScene(HelloWorld::scene());
}
void jinru::qiehuangoumai(CCObject* pSender)
{
    SimpleAudioEngine::sharedEngine()->playEffect("btn.mp3");
    CCDirector::sharedDirector()->replaceScene(goumaign::scene());
}
