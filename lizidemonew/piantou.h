//
//  piantou.h
//  lizidemonew
//
//  Created by gq on 13-1-1.
//
//

#ifndef __lizidemonew__piantou__
#define __lizidemonew__piantou__

#include "cocos2d.h"



#include "SimpleAudioEngine.h"

USING_NS_CC;
class piantou: public CCLayer
{
public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();

    // there's no 'id' in cpp, so we recommand to return the exactly class pointer
    static cocos2d::CCScene* scene();
    void showWenzi(float dt);
CCAnimation* animationWithSingleFramess(const char *name, int count, float delay);
    CREATE_FUNC(piantou);
    CCLabelTTF *_protectLight;
       int widths;
    CCSprite* createMaskedSprite(CCSprite* src, const char* maskFile);
    void qiehuan(CCObject* pSender);
    int shiying(int sr);
};


#endif /* defined(__lizidemonew__piantou__) */
