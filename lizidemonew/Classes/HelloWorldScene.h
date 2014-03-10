#ifndef __HELLOWORLDs_SCENE_H__
#define __HELLOWORLDs_SCENE_H__

#include "cocos2d.h"

#include "Monster.h"

#include "SimpleAudioEngine.h"

USING_NS_CC;
class HelloWorld: public cocos2d::CCLayer
{
public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();
    ~HelloWorld();
    // there's no 'id' in cpp, so we recommand to return the exactly class pointer
    static cocos2d::CCScene* scene();
    
    // a selector callback
    void menuCloseCallback(CCObject* pSender);
    CCSprite *waff;
    CCSprite *_baozha;
	CCPoint zhujiaoPT;
    void leftmove();
    void addTarget();
    CCSprite* m_pSprite;
    bool Ispengzhuang;
    // implement the "static node()" method manually
    CREATE_FUNC(HelloWorld);
	CCSize screensize;
    void qingchuwenzi(CCObject sender);
    CCPoint m_Point;
    CCArray *_targets;
    CCArray *_projectiles;
    CCObject* it;
    CCObject* jt;
    CCLabelTTF *_tishiyu;
       CCArray *projectilesToDelete;
        CCArray *projectilesToDelete1;
    CCArray* targetsToDelete;
	CCAnimation*  animationWithSingleFramess(const char *name, int count, float delay);
	void MyButDown_top(CCObject* pSender);
	void MyButUp_top(CCObject* pSender);
    void MyButDown_left(CCObject* pSender);
	void MyButUp_left(CCObject* pSender);
    void MyButDown_right(CCObject* pSender);
	void MyButUp_right(CCObject* pSender);
    void MyButDown_up(CCObject* pSender);
	void MyButUp_up(CCObject* pSender);
	bool m_bMovetop;
    bool m_bMoveleft;
    bool m_bMoveright;
    bool m_bMoveup;
    virtual void ccTouchesBegan(CCSet* touches, CCEvent* event);
    void gameLogic(float dt);
	void OnTimer(float dt);
    void upadates(float dt);
     void upadatePT(float dt);
    void upadatePG(float dt);
      void jindutiao(float dt);
       void qingchu(float dt);
    void shootzidan();
    Monster *paomo;
    CCSprite *_lifetiao;
    CCSprite *_backgrounds;
    int realX;
    void delates(CCObject* sender);
      void delatesL(CCObject* sender);
    CCLabelTTF *_storeLabel;
    CCProgressTimer *_cp;
    int _stores;
    void shoudan(float dt);
    int _pengzhuang;
    int ddw;
    CCLabelTTF *_scoreF;
    virtual void didAccelerate(CCAcceleration *pAccelerationValue);
    int fontSize;
    void qiehuan(CCObject* pSender);
    CCParticleSystem *_light;
       CCParticleSystem *_yuandian;
    CCSprite *yuandian;
    bool Isfashe;
    char* shiyinglizi();
    void proloadParticle();
    void xiayiguans(float dt);
     void zidanjingling(float dt);
    
void xiayiguan();
    int _gongjili;
    int shiying(int sr);
public:
    
    static const char* getStringByKey(const char * key){
        
        //获取当前系统环境语言类型
        ccLanguageType nType = CCApplication::sharedApplication()->getCurrentLanguage();
        
        //字典
        CCDictionary *pDic;
        
        if(1 == nType)
            //根据语言选择不同的属性表
            pDic = CCDictionary::createWithContentsOfFile("zh-Hans.plist");
        else
            pDic = CCDictionary::createWithContentsOfFile("en.plist");
        
        std::string keyStr = key;
        
        //返回key对应的value
        return (pDic -> valueForKey(keyStr))->getCString();
    }

};

#endif  // __HELLOWORLD_SCENE_H__