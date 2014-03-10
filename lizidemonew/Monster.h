//
//  Monster.h
//  lizidemoxin
//
//  Created by gq on 12-11-26.
//
//

#ifndef lizidemoxin_Monster_h
#define lizidemoxin_Monster_h

#include "cocos2d.h"
#include "DataModule.h"
USING_NS_CC;
class Monster : public cocos2d::CCSprite
{
	
private:
	
public:
	CC_SYNTHESIZE(int, _curHp, CurHp);
	CC_SYNTHESIZE(int, _minMoveDuration, MinMoveDuration);
	CC_SYNTHESIZE(int, _maxMoveDuration, MaxMoveDuration);
};
class WeakAndFastMonster : public Monster
{
public:
	static WeakAndFastMonster* monster() {
		
		WeakAndFastMonster *monster = NULL;
		
		monster = new WeakAndFastMonster();
		if (monster && monster->initWithFile("ww60035.png"))
		{
            Singleton *s=Singleton::SharedSingleton();
            
			monster->setCurHp(s->getCurHp());
        
			monster->setMinMoveDuration(s->getMinMoveDuration());
			monster->setMaxMoveDuration(s->getMaxMoveDuration());
            monster->setTag(1);
            
		}
		else {
			delete monster;
		}
		
		return monster;
	};
};
class StrongAndSlowMonster : public Monster
{
public:
	static StrongAndSlowMonster* monster() {
		
		StrongAndSlowMonster *monster = NULL;
		
		monster = new StrongAndSlowMonster();
		if (monster && monster->initWithFile("sjx.png"))
		{
                Singleton *s=Singleton::SharedSingleton();
			monster->setCurHp(s->getCurHp()+2);
			monster->setMinMoveDuration(s->getMinMoveDuration()+3);
			monster->setMaxMoveDuration(s->getMaxMoveDuration()+7);
          
            monster->setTag(2);
		}
		else {
			delete monster;
		}
		
		return monster;
	};
};
class VStrongAndVSlowMonster : public Monster
{
public:
	static StrongAndSlowMonster* monster() {
		
		StrongAndSlowMonster *monster = NULL;
		
		monster = new StrongAndSlowMonster();
		if (monster && monster->initWithFile("zfx.png"))
		{
              Singleton *s=Singleton::SharedSingleton();
			monster->setCurHp(s->getCurHp()+4);
			monster->setMinMoveDuration(s->getMinMoveDuration()+3);
			monster->setMaxMoveDuration(s->getMaxMoveDuration()+7);
            
            monster->setTag(3);
		}
		else {
			delete monster;
		}
		
		return monster;
	};
};
#endif
