//
//  goumaign.cpp
//  lizidemonew
//
//  Created by gq on 13-1-6.
//
//

#include "goumaign.h"
#include "HelloWorldScene.h"
#include "GameKitHelper.h"
#include "goumai.h"
#include "jinru.h"


using namespace cocos2d;
using namespace CocosDenshion;
CCScene* goumaign::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();
    
    // 'layer' is an autorelease object
    goumaign *layer = goumaign::create();
    
    
    // add layer as a child to scene
    scene->addChild(layer);
    
    // return the scene
    return scene;
}
int goumaign::shiying(int sr)
{
    CCDirector *pDirector = CCDirector::sharedDirector();
    CCSize ww=CCDirector::sharedDirector()->getWinSize();
    CCEGLView* pEGLView = CCEGLView::sharedOpenGLView();
    CCSize frameSize = pEGLView->getFrameSize();
    if (frameSize.height>768) {
        return sr;
        
        
    }
    else if (frameSize.height>320) {
        return sr/2;
    }
    else
    {
        return sr/4;
    }
    
    
}
bool goumaign::init()
{
    if ( !CCLayer::init() )
    {
        return false;
    }
    
    screensize=CCDirector::sharedDirector()->getWinSize();
       fontSize=10*screensize.height/320;
    CCSprite *_backgound=CCSprite::create("1.jpg");
    _backgound->setPosition(ccp(screensize.width/2,screensize.height/2));
    this->addChild(_backgound);
    CCSprite *_houtui=CCSprite::create("houtui.png");
    CCSprite *_houtui1=CCSprite::create("houtui.png");
    CCMenuItemSprite *_houtuiM=CCMenuItemSprite::create(_houtui, _houtui1, this, menu_selector(goumaign::fanhui));
    _houtuiM->setPosition(ccp(screensize.width*0.1,screensize.height*0.1));
    CCMenu *_fanhuiMM=CCMenu::create(_houtuiM,NULL);
    _fanhuiMM->setPosition(ccp(0,0));
    this->addChild(_fanhuiMM);
    //宇宙行星
    CCParticleSystem *_xingxing=CCParticleSystemQuad::create("ss.plist");
    _xingxing->setScale(shiying(4));
    _xingxing->setAutoRemoveOnFinish(true);
    _xingxing->setPosition(ccp(screensize.width*0.5,screensize.height*0.5));
    this->addChild(_xingxing);
    //购买图标1
    {
        CCSprite *iap_bg  = CCSprite::create("lanseblade.png");
          CCSprite *iap_bg1  = CCSprite::create("lanseblade1.png");
        CCMenuItemSprite *_spriteM=CCMenuItemSprite::create(iap_bg, iap_bg1,this,menu_selector(goumaign::buy11));
        _spriteM->setPosition(ccp(screensize.width*0.3,screensize.height*0.7));
     
        CCMenu *goumaipic=CCMenu::create(_spriteM,NULL);
        
        goumaipic->setPosition(ccp(0,0));
//        NSString *_strss=NSLocalizedStringFromTable(@"blueblade",@"MiracleInternation", nil);
//        const char *color_chars = [_strss cStringUsingEncoding:NSASCIIStringEncoding];
        CCLabelTTF *miaoshu=CCLabelTTF::create(goumaign::getStringByKey("blueblade"), "HiraKakuProN-W6", fontSize);
        miaoshu->setPosition(ccp(screensize.width*0.33,screensize.height*0.63));
        miaoshu->setDimensions(CCSizeMake(shiying(400), shiying(360)));
        this->addChild(miaoshu,999);
        this->addChild(goumaipic);
        
        CCLog("点击购买图标");


    }
    //购买图标2
    {
        CCSprite *iap_bg  = CCSprite::create("hongseblade.png");
        CCSprite *iap_bg1  = CCSprite::create("hongseblade.png");
        CCMenuItemSprite *_spriteM=CCMenuItemSprite::create(iap_bg, iap_bg1,this,menu_selector(goumaign::buy22));
        _spriteM->setPosition(ccp(screensize.width*0.7,screensize.height*0.7));
        
        CCMenu *goumaipic=CCMenu::create(_spriteM,NULL);
        
        goumaipic->setPosition(ccp(0,0));
//        NSString *_strss=NSLocalizedStringFromTable(@"",@"MiracleInternation", nil);
//        const char *color_chars = [_strss cStringUsingEncoding:NSASCIIStringEncoding];
    
        CCLabelTTF *miaoshu=CCLabelTTF::create(goumaign::getStringByKey("redblade"), "HiraKakuProN-W6", fontSize);
        miaoshu->setPosition(ccp(screensize.width*0.73,screensize.height*0.63));
        miaoshu->setDimensions(CCSizeMake(shiying(400), shiying(360)));
        this->addChild(miaoshu,999);
        this->addChild(goumaipic);
        
        
    }
    //购买图标33
    {
        CCSprite *iap_bg  = CCSprite::create("qicaidblade.png");
        CCSprite *iap_bg1  = CCSprite::create("qicaidblade.png");
        CCMenuItemSprite *_spriteM=CCMenuItemSprite::create(iap_bg, iap_bg1,this,menu_selector(goumaign::buy33));
        _spriteM->setPosition(ccp(screensize.width*0.5,screensize.height*0.3));
        
        CCMenu *goumaipic=CCMenu::create(_spriteM,NULL);
        
        goumaipic->setPosition(ccp(0,0));
//        NSString *_strss=NSLocalizedStringFromTable(@"colorfulblade",@"MiracleInternation", nil);
//        const char *color_chars = [_strss cStringUsingEncoding:NSASCIIStringEncoding];
        CCLabelTTF *miaoshu=CCLabelTTF::create(goumaign::getStringByKey("colorfulblade"), "HiraKakuProN-W6", fontSize);
        miaoshu->setPosition(ccp(screensize.width*0.53,screensize.height*0.23));
        miaoshu->setDimensions(CCSizeMake(shiying(400), shiying(360)));
        this->addChild(miaoshu,999);
        this->addChild(goumaipic);
        
        
    }
    
    
    return true;
    
    
}
void goumaign::buy11()
{
    [[goumai sharedgoumai] buy1];
    CCLog("已经点击");
 
}
void goumaign::buy22()
{
    [[goumai sharedgoumai] buy2];
    
}
void goumaign::buy33()
{
    [[goumai sharedgoumai] buy3];
    
}
void goumaign::fanhui()
{
    CCDirector::sharedDirector()->replaceScene(jinru::scene());
    
}


