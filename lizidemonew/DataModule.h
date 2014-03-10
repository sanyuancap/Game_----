//
//  DataModule.h
//  lizidemonew
//
//  Created by gq on 12-12-6.
//
//

#ifndef __lizidemonew__DataModule__
#define __lizidemonew__DataModule__
#include "cocos2d.h"
USING_NS_CC;

class Singleton:CCLayer
{
public:
    
CC_SYNTHESIZE(int, _Scores, Scores);
CC_SYNTHESIZE(int, _curHp, CurHp);
CC_SYNTHESIZE(int, _minMoveDuration, MinMoveDuration);
CC_SYNTHESIZE(int, _maxMoveDuration, MaxMoveDuration);
CC_SYNTHESIZE(char*, _backGrounds, backGrounds);
    CCArray *_waves=CCArray::create();
    //全局访问点
    static Singleton* SharedSingleton()
    {
        if(NULL == m_spSingleton)
        {
            m_spSingleton = new Singleton();
        }
        return m_spSingleton;
    }
    void xiayiguan(int _Scores);

private:
    static Singleton* m_spSingleton;
    Singleton();
    Singleton(const Singleton& other);
    Singleton& operator=(const Singleton& other);
};

#endif /* defined(__lizidemonew__DataModule__) */
