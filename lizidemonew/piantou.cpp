//
//  piantou.cpp
//  lizidemonew
//
//  Created by gq on 13-1-1.
//
//

#include "piantou.h"

#include "HelloWorldScene.h"
#include "jinru.h"
using namespace cocos2d;
using namespace CocosDenshion;
CCScene* piantou::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();
    
    // 'layer' is an autorelease object
    piantou *layer1 = piantou::create();
    
    
    // add layer as a child to scene
    scene->addChild(layer1);
    
    // return the scene
    return scene;
}
int piantou::shiying(int sr)
{
//       CCDirector *pDirector = CCDirector::sharedDirector();
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
bool piantou::init()
{
    if ( !CCLayer::init() )
    {
        return false;
    }
    //////////////////////////////////////////////////////////////////////////
    // super init first
    //////////////////////////////////////////////////////////////////////////
    this->setTouchEnabled(true);
    CCSize screensize=CCDirector::sharedDirector()->getWinSize();
//    CCSprite *_background=CCSprite::create("beijing.jpg");
//    _background->setPosition(ccp(screensize.width/2,screensize.height/2));
//    this->addChild(_background);
    //日食
    CCSprite *_sun=CCSprite::create("sun.png");
    
    _sun->setPosition(ccp(screensize.width*0.6,screensize.height*0.5));
    CCFadeIn *fadein=CCFadeIn::create(4);
    CCMoveBy *moveby=CCMoveBy::create(4, ccp(shiying(-80),0));
    _sun->runAction(CCSpawn::create(fadein,moveby,NULL));
    this->addChild(_sun,1);
    CCSprite *_heishi=CCSprite::create("heishi.png");
    
  _heishi->setPosition(ccp(screensize.width*0.6,screensize.height*0.5));
    

    this->addChild(_heishi,3);
     //发射光芒
//    CCSprite *_flare=CCSprite::create("Flare.png");
//    _flare->setPosition(ccp(screensize.width*0.4,screensize.height*0.5));
//    _flare->setScale(0);
//    CCDelayTime *ccdelaytime=CCDelayTime::create(4);
//    CCScaleTo *scaleto=CCScaleTo::create(2,1);
//    _flare->runAction(CCSequence::create(ccdelaytime,scaleto,NULL));
//    this->addChild(_flare,1);
    
    
//文字特效
    
  
   _protectLight=CCLabelTTF::create("Protect Light", "Helvetica-Bold",25*screensize.height/320);
        CCDelayTime *ccdelaytimes=CCDelayTime::create(4);
    //切换场景
    CCCallFuncN *fews=CCCallFuncN::create(this, callfuncN_selector(piantou::qiehuan));
    _protectLight->setOpacity(0);
    _protectLight->runAction(CCSequence::create(ccdelaytimes,CCFadeIn::create(4),fews,NULL));
    _protectLight->setPosition(ccp(screensize.width*0.6,screensize.height*0.5));
    this->addChild(_protectLight,4);
    schedule(schedule_selector(piantou::showWenzi),0.1);
    
    //宇宙行星
    CCParticleSystem *_xingxing=CCParticleSystemQuad::create("ss.plist");
     _xingxing->setScale(shiying(4));
    _xingxing->setAutoRemoveOnFinish(true);
    _xingxing->setPosition(ccp(screensize.width*0.5,screensize.height*0.5));
    this->addChild(_xingxing);
   
  
    
 
    return true;
}

CCAnimation* piantou::animationWithSingleFramess(const char *name, int count, float delay)
{
	CCArray *animFrames=CCArray::create();
	char str[100] = {0};
	for(int i=0;i<count;i++)
	{
		sprintf(str, "%s%d.png", name, (i+1));
        
        
		CCSpriteFrame* frame=CCSpriteFrameCache::sharedSpriteFrameCache()->spriteFrameByName(str);
		animFrames->addObject(frame);
        
        
	}
	CCAnimation *walkAnim=CCAnimation::createWithSpriteFrames(animFrames,delay);
	return walkAnim;
}
void piantou::showWenzi(float dt)
{

    
    
}
void piantou::qiehuan(CCObject* pSender)
{
      CCTransitionFade* transitionScene = CCTransitionFade::transitionWithDuration(1.0,jinru::scene());
    
    CCDirector::sharedDirector()->replaceScene(transitionScene);
}
