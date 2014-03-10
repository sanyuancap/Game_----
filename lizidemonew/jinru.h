#ifndef __HELLOWORLD_SCENE_H__
#define __HELLOWORLD_SCENE_H__

#include "cocos2d.h"



#include "SimpleAudioEngine.h"



USING_NS_CC;
class jinru : public cocos2d::CCLayer
{
public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();
   
    // there's no 'id' in cpp, so we recommand to return the exactly class pointer
    static cocos2d::CCScene* scene();
    void qiehuan(CCObject* pSender);
    void qiehuangoumai(CCObject* pSender);
    void showStart(CCObject* pSender);
    void showPaihangbang(CCObject* pSender);
    CCSize screensize;
    // implement the "static node()" method manually
    CREATE_FUNC(jinru);
    CCLabelTTF *startGameFF_an;
      CCLabelTTF *ss;
    int fontSize;
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