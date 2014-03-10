//
//  lizidemonewAppDelegate.cpp
//  lizidemonew
//
//  Created by gq on 12-11-27.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//

#include "AppDelegate.h"

#include "cocos2d.h"
#include "jinru.h"

#import "GameKitHelper.h"
#import "piantou.h"
#import "DataModule.h"



USING_NS_CC;

AppDelegate::AppDelegate()
{
 
}

AppDelegate::~AppDelegate()
{
}

bool AppDelegate::applicationDidFinishLaunching()
{


    // initialize director
    [[GameKitHelper sharedGameKitHelper] authenticateLocalUser];
    CCDirector *pDirector = CCDirector::sharedDirector();
     CCEGLView* pEGLView = CCEGLView::sharedOpenGLView();
      pDirector->setOpenGLView(pEGLView);
    

    CCSize ww=CCDirector::sharedDirector()->getWinSize();
    
    CCSize frameSize = pEGLView->getFrameSize();
     pDirector->setContentScaleFactor(1);
    if (frameSize.height>768) {
            pDirector->setContentScaleFactor(1);
        
        
    }
    else if (frameSize.height>320) {
        pDirector->setContentScaleFactor(2);
    }
    else
    {
         pDirector->setContentScaleFactor(4);
    }

    // turn on display FPS
    pDirector->setDisplayStats(true);
    // set FPS. the default value is 1.0/60 if you don't call this
    pDirector->setAnimationInterval(1.0 / 60);
    
    // create a scene. it's an autorelease object
    CCScene *pScene = piantou::scene();
    
    // run
    pDirector->runWithScene(pScene);
    
    
    return true;
}

// This function will be called when the app is inactive. When comes a phone call,it's be invoked too
void AppDelegate::applicationDidEnterBackground()
{
    CCDirector::sharedDirector()->pause();
    CCDirector::sharedDirector()->stopAnimation();
    // if you use SimpleAudioEngine, it must be paused
//     CocosDenshion::SimpleAudioEngine::sharedEngine()->pauseBackgroundMusic();
}

// this function will be called when the app is active again
void AppDelegate::applicationWillEnterForeground()
{
    CCDirector::sharedDirector()->resume();
    CCDirector::sharedDirector()->startAnimation();
    // if you use SimpleAudioEngine, it must resume here
//  CocosDenshion::SimpleAudioEngine::sharedEngine()->resumeBackgroundMusic();
}
