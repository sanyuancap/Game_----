#include "MyContrl.h"

/*********************************************/
/*²Ë²Ë QQ£º170859027*/
/*********************************************/
CMyContrl::CMyContrl(void)
{
}

CMyContrl::~CMyContrl(void)
{
}

CMyContrl * CMyContrl::create(CCNode* normalSprite, CCNode* selectedSprite,CCObject *target, SEL_MenuHandler selector1,SEL_MenuHandler selector2)
{
	CMyContrl *pRet = new CMyContrl();
	pRet->init(normalSprite, selectedSprite, target, selector1, selector2); 
	pRet->autorelease();
	return pRet;
}

void CMyContrl::init(CCNode* normalSprite, CCNode* selectedSprite,CCObject *target, SEL_MenuHandler selector1,SEL_MenuHandler selector2)
{
	CCMenuItemSprite::initWithNormalSprite(normalSprite,selectedSprite,NULL,NULL,NULL);
	m_pListener1 = target;
	m_pfnSelector1 = selector1;
	m_pfnSelector2 = selector2;
}

void CMyContrl::selected()
{
	CCMenuItemSprite::selected();

	if (m_pListener1 && m_pfnSelector1)
	{
		(m_pListener1->*m_pfnSelector1)(this);
	}
}

void CMyContrl::unselected()
{
	CCMenuItemSprite::unselected();

	if (m_pListener1 && m_pfnSelector2)
	{
		(m_pListener1->*m_pfnSelector2)(this);
	}
}