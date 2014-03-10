#pragma once
#include "cocos2d.h"
#include "SimpleAudioEngine.h"

using namespace cocos2d;

/*********************************************/
/*²Ë²Ë QQ£º170859027*/
/*********************************************/

class CMyContrl : public CCMenuItemSprite
{
public:
	CMyContrl(void);
	~CMyContrl(void);
    
	static CMyContrl * create(CCNode* normalSprite, CCNode* selectedSprite,CCObject *target, SEL_MenuHandler selector1,SEL_MenuHandler selector2);
	void init(CCNode* normalSprite, CCNode* selectedSprite,CCObject *target, SEL_MenuHandler selector1,SEL_MenuHandler selector2);
	virtual void unselected();
	virtual void selected();
public:
	SEL_MenuHandler m_pfnSelector1;
	SEL_MenuHandler m_pfnSelector2;
	CCObject* m_pListener1;
};
