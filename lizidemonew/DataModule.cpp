//
//  DataModule.cpp
//  lizidemonew
//
//  Created by gq on 12-12-6.
//
//

#include "DataModule.h"

Singleton* Singleton::m_spSingleton = NULL;

Singleton::Singleton()
{

}
void Singleton::xiayiguan(int _Scores)
{
    if (_Scores>=0) {
        _curHp=1;
        _minMoveDuration=3;
        _maxMoveDuration=5;
          _backGrounds="background1.jpg";
          CCLog("已经初始化第一关");
        
    }
    if (_Scores>20) {
        _curHp=2;
        _minMoveDuration=4;
        _maxMoveDuration=6;
        _backGrounds="background2.jpg";
        CCLog("已经初始化第二关");
    }
    if (_Scores>50) {
        _curHp=4;
        _minMoveDuration=6;
        _maxMoveDuration=8;
          _backGrounds="background3.jpg";
         CCLog("已经初始化第三关");
    }
    if (_Scores>70) {
         _backGrounds="background4.jpg";
        CCSprite *ss=CCSprite::create("yuandian.png");
        ss->setPosition(ccp(223,212));
        
        ss->setScale(4);
        this->addChild(ss);
              CCLog("已经初始化第四关");
    }
}


