#include "HelloWorldScene.h"
#include "MyContrl.h"

#include "GameKitHelper.h"
#include "DataModule.h"
#include "goumai.h"
#include "jinru.h"
using namespace cocos2d;
using namespace CocosDenshion;


HelloWorld::~HelloWorld()
{
	if (_targets)
	{
		_targets->release();
		_targets = NULL;
	}
    
	if (_projectiles)
	{
		_projectiles->release();
		_projectiles = NULL;
	}
    
	// cpp don't need to call super dealloc
	// virtual destructor will do this
}
CCScene* HelloWorld::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();
    
    // 'layer' is an autorelease object
    HelloWorld *layer = HelloWorld::create();
    
    // add layer as a child to scene
    scene->addChild(layer);
    
    // return the scene
    return scene;

}
int HelloWorld::shiying(int sr)
{
    CCDirector *pDirector = CCDirector::sharedDirector();
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
char* HelloWorld::shiyinglizi()
{
    char *zidan;
    CCDirector *pDirector = CCDirector::sharedDirector();
    CCSize ww=CCDirector::sharedDirector()->getWinSize();
    CCEGLView* pEGLView = CCEGLView::sharedOpenGLView();
    CCSize frameSize = pEGLView->getFrameSize();
    if (frameSize.height>768) {
      
      zidan="zidan3.plist";
        return zidan;
        
        
    }
    else if (frameSize.height>320) {
          zidan="zidan2.plist";
            return zidan;
    }
    else
    {
         zidan="zidan1.plist";
            return zidan;
    }
    
    
}
// on "init" you need to initialize your instance
bool HelloWorld::init()
{
    if ( !CCLayer::init() )
    {
        return false;
    }
        //////////////////////////////////////////////////////////////////////////
        // super init first
        //////////////////////////////////////////////////////////////////////////
        this->setTouchEnabled(true);
    this->setAccelerometerEnabled(true);
    //提示语
     CCDirector::sharedDirector()->resume();
      screensize=CCDirector::sharedDirector()->getWinSize();
  _tishiyu=CCLabelTTF::create(HelloWorld::getStringByKey("fashe"),"Verdana", shiying(65));
    _tishiyu->setColor(ccc3(255, 252, 0));
    _tishiyu->setPosition(ccp(screensize.width*0.3,screensize.height*0.7));
    this->addChild(_tishiyu,99);
    CCBlink *_blikWenzi=CCBlink::create(5, 5);
    CCCallFuncN *_huidiao=CCCallFuncN::create(this, callfuncN_selector(HelloWorld::qingchuwenzi));
    _tishiyu->runAction(CCSequence::create(_blikWenzi,_huidiao,NULL));
       //
        //////////////////////////////////////////////////////////////////////////
        // add your codes below...
        //////////////////////////////////////////////////////////////////////////
        //设置初始位置
        SimpleAudioEngine::sharedEngine()->playEffect("come.mp3");
		CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("lizitietu.plist");
        CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("baozhatietu.plist");

    
        
        CCAnimation *anima=animationWithSingleFramess("lizi1018",7,0.1f);
      
    CCParticleSystem *_xingxing=CCParticleSystemQuad::create("ss.plist");
    _xingxing->setScale(shiying(4));
    _xingxing->setAutoRemoveOnFinish(true);
    _xingxing->setPosition(ccp(screensize.width*0.5,screensize.height*0.5));
    this->addChild(_xingxing);
    schedule(schedule_selector(HelloWorld::zidanjingling));
    //第一关
    _stores=0;
    Singleton *s=Singleton::SharedSingleton();
    s->xiayiguan(_stores);
   _backgrounds=CCSprite::create(s->getbackGrounds());
    _backgrounds->setPosition(ccp(screensize.width/2,screensize.height/2));
    this->addChild(_backgrounds,-2);

   m_Point =CCPointMake(screensize.width/2.,screensize.height/2);
    waff=CCSprite::create("22.jpg");
    waff->setVisible(false);
    
		waff->setPosition(m_Point);

    
		this->addChild(waff);
      
    _light=CCParticleSystemQuad::create("light.plist");
    _light->setScale(shiying(4));
    _light->setPosition(m_Point);
    this->addChild(_light,-1);
    

        
        _targets = new CCArray;
		_projectiles = new CCArray;
        //设置按键坐标
        CCSprite *normalSprites = CCSprite::create("biaoqing1.png");
		CCSprite *selectedSprites = CCSprite::create("biaoqing1.png");
    selectedSprites->setColor(ccc3(252, 255, 0));
        CMyContrl *_topbutton = CMyContrl::create(normalSprites,selectedSprites,this,menu_selector(HelloWorld::MyButDown_top),menu_selector(HelloWorld::MyButUp_top));
        
        

        _topbutton->setPosition(screensize.width*0.1,screensize.height*0.17);
        CCSprite *normalSpritez = CCSprite::create("biaoqing2.png");
		CCSprite *selectedSpritez = CCSprite::create("biaoqing2.png");
       selectedSpritez->setColor(ccc3(252, 255, 0));
        CMyContrl *_leftbutton = CMyContrl::create(normalSpritez,selectedSpritez,this,menu_selector(HelloWorld::MyButDown_left),menu_selector(HelloWorld::MyButUp_left));
           _leftbutton->setPosition(screensize.width*0.05,screensize.height*0.1);
        
        
        
        CCSprite *normalSpritey = CCSprite::create("biaoqing3.png");
		CCSprite *selectedSpritey = CCSprite::create("biaoqing3.png");
           selectedSpritey->setColor(ccc3(252, 255, 0));
         CMyContrl *_rightbutton = CMyContrl::create(normalSpritey,selectedSpritey,this,menu_selector(HelloWorld::MyButDown_right),menu_selector(HelloWorld::MyButUp_right));        _rightbutton->setPosition(screensize.width*0.15,screensize.height*0.1);
        
        
        CCSprite *normalSpritex = CCSprite::create("biaoqing4.png");
		CCSprite *selectedSpritex = CCSprite::create("biaoqing4.png");
        selectedSpritex->setColor(ccc3(252, 255, 0));
        CMyContrl *_upbutton = CMyContrl::create(normalSpritex,selectedSpritex,this,menu_selector(HelloWorld::MyButDown_up),menu_selector(HelloWorld::MyButUp_up));
        _upbutton->setPosition(screensize.width*0.1,screensize.height*0.04);



      
        CCMenu *_allbutton=CCMenu::create(_topbutton,_leftbutton,_rightbutton,_upbutton,NULL);
        _allbutton->setPosition(CCPointMake(0, 0));
        this->addChild(_allbutton);
    //初始化攻击力
  
    NSMutableArray*temp =(NSMutableArray*)[[goumai sharedgoumai] loadGameData:@"Miracle"];;
    CCLOG("%@",[temp objectAtIndex:0]);
    int chushihuaInt;
    if ([temp objectAtIndex:0]==nil) {
        
        chushihuaInt=0;
        
    }
    else
    {
        
        chushihuaInt=[[temp objectAtIndex:0] intValue];
    }
    _gongjili=chushihuaInt+1;


    
		schedule(schedule_selector(HelloWorld::upadates),0.01);
        schedule(schedule_selector(HelloWorld::OnTimer),0.1);
    
        schedule(schedule_selector(HelloWorld::gameLogic),3);
        //设置分数
        char fenshu[100] = {0};
        sprintf(fenshu, "score:%d",_stores);
        _storeLabel=CCLabelTTF::create(fenshu,"Verdana", 22);
        _storeLabel->setPosition(ccp(screensize.width*0.1,screensize.height*0.9));
        _storeLabel->setColor(ccc3(255, 255, 255));
        this->addChild(_storeLabel);
        _lifetiao=CCSprite::create("lifetiao.jpg");
    _lifetiao->setScaleY(0.5);

    
    
  
  
    _lifetiao->setPosition(ccp(screensize.width*0.7,screensize.height*0.9));
    _lifetiao->setAnchorPoint(ccp(0,0.5));
    _pengzhuang=_lifetiao->getContentSize().width;
    ddw=_lifetiao->getContentSize().width/10;
        this->addChild(_lifetiao);
    
    schedule(schedule_selector(HelloWorld::qingchu));
        


    

    
    
    
 return true;
}

// void HelloWorld::upadatePG(float dt)
//{
//  int dd=_cp->getPercentage();
//    dd-=1;
//  
//
//}
void HelloWorld::gameLogic(float dt)
{
	this->addTarget();
    
}
void HelloWorld::qingchuwenzi(CCObject sender)
{
   
    this->removeChild(_tishiyu, YES);
}


void HelloWorld::OnTimer(float dt)
{
    //向上移动
	if (m_bMovetop == true)
	{
        m_Point.y += screensize.height/50;
		m_Point.y = m_Point.y >=screensize.height-waff->getContentSize().height/2? screensize.height-waff->getContentSize().height/2 : m_Point.y;
       waff->setPosition(m_Point);
         _light->setPosition(waff->getPosition());
		
	}
    //向左移动
	if (m_bMoveleft == true)
	{
        m_Point.x -= screensize.height/50;
		m_Point.x = m_Point.x <=waff->getContentSize().width/2? waff->getContentSize().width/2: m_Point.x;
        waff->setPosition(m_Point);
		
	}
    //向右移动
	if (m_bMoveright == true)
	{
        m_Point.x += screensize.height/50;
		m_Point.x = m_Point.x >=screensize.width-waff->getContentSize().width/2? screensize.width-waff->getContentSize().width/2 : m_Point.x;
        waff->setPosition(m_Point);
		
	}
    //向下移动
	if (m_bMoveup == true)
	{
        m_Point.y -= screensize.height/50;
		m_Point.y = m_Point.y <=waff->getContentSize().height/2? waff->getContentSize().height/2: m_Point.y;
        waff->setPosition(m_Point);
		
	}
    _light->setPosition(waff->getPosition());
    
//    if (Isfashe==true) {
//         _yuandian->setPosition(yuandian->getPosition());
//    }
//    
    if (_stores>=0) {
        Singleton *s=Singleton::SharedSingleton();
        s->xiayiguan(_stores);
           CCLog("进入第一关");
    }
   
    if (_stores>20) {
        Singleton *s=Singleton::SharedSingleton();
        s->xiayiguan(_stores);
      
CCTexture2D * texture =CCTextureCache::sharedTextureCache()->addImage(s->getbackGrounds());//新建贴图
        _backgrounds->setTexture(texture);
        CCLog("进入第二关");
    }
    if (_stores>50) {
        Singleton *s=Singleton::SharedSingleton();
        s->xiayiguan(_stores);
CCTexture2D * texture =CCTextureCache::sharedTextureCache()->addImage(s->getbackGrounds());//新建贴图
        _backgrounds->setTexture(texture);
         CCLog("进入第三关");
    }
    if (_stores>70) {
        Singleton *s=Singleton::SharedSingleton();
        s->xiayiguan(_stores);
CCTexture2D * texture =CCTextureCache::sharedTextureCache()->addImage(s->getbackGrounds());//新建贴图
        _backgrounds->setTexture(texture);
         CCLog("进入第四关");
    }

    
}

void HelloWorld::delates(CCObject* sender)
{
    this->removeChild(_baozha, true);
}

  void HelloWorld::delatesL(CCObject* sender)
{
    this->removeChild(_scoreF,true);
}
void HelloWorld::upadates(float dt)
{
    
    
    bool monsterHit = false;

  projectilesToDelete = new CCArray;
   it = NULL;
   jt = NULL;
    
//for (it = _projectiles->begin(); it != _projectiles->end(); it++)
   CCARRAY_FOREACH(_projectiles, it)
{
   CCSprite *projectile = dynamic_cast<CCSprite*>(it);
	CCRect projectileRect =projectile->boundingBox();
       
	targetsToDelete =new CCArray;
    //清楚屏幕外面的子弹
    if (projectile->getPosition().x<0-projectile->getContentSize().width/2||projectile->getPosition().x>screensize.width+projectile->getContentSize().width/2||projectile->getPosition().y<0-projectile->getContentSize().height/2||projectile->getPosition().y>screensize.height+projectile->getContentSize().height/2) {
      projectilesToDelete->addObject(projectile);
        
    }

//       for (jt = _targets->begin(); jt != _targets->end(); jt++)
       CCARRAY_FOREACH(_targets, jt)
	{
			CCSprite *target = dynamic_cast<CCSprite*>(jt);
			CCRect targetRect =target->boundingBox();
          
   
          if (projectileRect.intersectsRect(targetRect))
		{
      
            monsterHit = true;
            
             Monster *monster = (Monster *)target;
              monster->setCurHp(monster->getCurHp()-_gongjili);
              if (monster->getCurHp() <= 0)
              {
                  //播放爆炸
                  CCLog("发生爆炸");
                  CCAnimation *anima1=animationWithSingleFramess("lizi2000",7,0.1f);
                  
                  _baozha=CCSprite::createWithSpriteFrameName("lizi20001.png");
                  if (monster->getTag()==1) {
                      _baozha->setColor(ccc3(251, 245,81));
                  }
                   if (monster->getTag()==2) {
                  _baozha->setColor(ccc3(201,42,42));
                   }
                  if (monster->getTag()==3) {
                      _baozha->setColor(ccc3(100,240,251));
                  }
                  _baozha->setPosition(CCPointMake(target->getPosition().x,target->getPosition().y));
                  CCCallFuncN *few=CCCallFuncN::create(this, callfuncN_selector(HelloWorld::delates));
                  _baozha->runAction(CCSequence::create((CCAnimate::create(anima1)),few,NULL));
                  
                  this->addChild(_baozha);
                                    
                  
                targetsToDelete->addObject(target);
                  
               if (monster->getTag()==2) {
                      
                 
                 _scoreF=CCLabelTTF::create("+3","Helvetica-Bold", 20);
                  
                  _scoreF->setColor(ccc3(201,42,42));
                  _scoreF->setPosition(ccp(target->getPosition().x,target->getPosition().y));
                  CCMoveBy *_shuziS=CCMoveBy::create(1, ccp(0,20));
                  CCFadeOut *_xiaoShi=CCFadeOut::create(0.5);
                     CCCallFuncN *fews=CCCallFuncN::create(this, callfuncN_selector(HelloWorld::delatesL));
                   _scoreF->runAction(CCSequence::create(CCSpawn::create(_shuziS,_xiaoShi,NULL),fews,NULL));
                  this->addChild(_scoreF);
                     }
                  if (monster->getTag()==3) {
                      
                      
                      _scoreF=CCLabelTTF::create("+5","Helvetica-Bold", 25);
                      
                      _scoreF->setColor(ccc3(100,240,251));
                      _scoreF->setPosition(ccp(target->getPosition().x,target->getPosition().y));
                      CCMoveBy *_shuziS=CCMoveBy::create(1, ccp(0,20));
                      CCFadeOut *_xiaoShi=CCFadeOut::create(0.5);
                      CCCallFuncN *fews=CCCallFuncN::create(this, callfuncN_selector(HelloWorld::delatesL));
                      _scoreF->runAction(CCSequence::create(CCSpawn::create(_shuziS,_xiaoShi,NULL),fews,NULL));
                      this->addChild(_scoreF);
                  }
                  if (monster->getTag()==1) {
                        _stores++;
                  }
                  if (monster->getTag()==2) {
                      _stores+=3;
                  }
                  if (monster->getTag()==2) {
                      _stores+=3;
                  }
                
                  char fenshu[100] = {0};
                  sprintf(fenshu, "score:%d",_stores);
                  _storeLabel->setString(fenshu);
             
            }
             
               
         
            
		}
        
         		}
        
// for (jt = targetsToDelete->begin(); jt != targetsToDelete->end(); jt++)
        CCARRAY_FOREACH(targetsToDelete, jt)
	{
			CCSprite *target = dynamic_cast<CCSprite*>(jt);
			_targets->removeObject(target);
			this->removeChild(target, true);
           
           
        
           
		}
       
        
      if (monsterHit) {
		projectilesToDelete->addObject(projectile);
           SimpleAudioEngine::sharedEngine()->playEffect("explo0.mp3");
       }
		
		targetsToDelete->release();
    
    
	}
   
//for (it = projectilesToDelete->begin(); it != projectilesToDelete->end(); it++)
   CCARRAY_FOREACH(projectilesToDelete, it)
  {
		CCSprite* projectile = dynamic_cast<CCSprite*>(it);
	_projectiles->removeObject(projectile);
		this->removeChild(projectile, true);
	}
	projectilesToDelete->release();
    
    
    
    

  


    

}
void HelloWorld::shoudan(float dt)
{
    
}
void HelloWorld::zidanjingling(float dt)
{
      CCObject* jts=NULL;
//       CCObject* its=NULL;
    CCArray *targetsToDelete1 =new CCArray;
   bool Ispengzhuangs=false;
    CCARRAY_FOREACH(_targets, jts)
	{
     
        CCSprite *target = dynamic_cast<CCSprite*>(jts);
        
        CCRect targetRect =target->boundingBox();
    if (targetRect.intersectsRect(CCRectMake(waff->getPosition().x-waff->getContentSize().width/4, waff->getPosition().y-waff->getContentSize().height/4, waff->getContentSize().width, waff->getContentSize().height))) {
        
 
               Ispengzhuangs=true;
        CCMoveTo *_youyidong=CCMoveTo::create(0.1, ccp(3,0));
        CCMoveTo *_zuoyidong=CCMoveTo::create(0.1, ccp(-3,0));
        
        this->runAction(CCRepeat::create(CCSequence::create(_youyidong,_zuoyidong,NULL),4));
        
        
        
        _pengzhuang-=ddw;
        CCLog("发生碰撞并减少生命");
        
        _lifetiao->setTextureRect(CCRectMake(0,0,_pengzhuang, _lifetiao->getContentSize().height));

        
        
        //生命=0
        if (_pengzhuang<=0) {
            
           
           
                
                [[GameKitHelper sharedGameKitHelper] reportScore:_stores forCategory:@"grp.rank"];                   SimpleAudioEngine::sharedEngine()->playBackgroundMusic("fail.mp3");
                CCSize screensize=CCDirector::sharedDirector()->getWinSize();
                CCLabelTTF *_gameOverF=CCLabelTTF::create("GAME OVER", "Helvetica-Bold", 25*screensize.height/320);
                _gameOverF->setPosition(ccp(screensize.width/2,screensize.height*0.6));
                this->addChild(_gameOverF);
                CCLabelTTF *_gameOverFF=CCLabelTTF::create("Restart", "Helvetica-Bold",25*screensize.height/320);
                CCMenuItemLabel *_gameOverFM=CCMenuItemLabel::create(_gameOverFF, this, menu_selector(HelloWorld::qiehuan));
            
                _gameOverFM->setPosition(ccp(screensize.width/2,screensize.height*0.4));
                
                CCMenu *_gameOverM=CCMenu::create(_gameOverFM,NULL);
                _gameOverM->setPosition(ccp(0,0));
                this->addChild(_gameOverM);
            
                CCLog("游戏结束");
                CCDirector::sharedDirector()->pause();
              
            }
        
        
        
        
    }
        
    if (Ispengzhuangs==true) {
                targetsToDelete1->addObject(target);
    

    }
    }
    CCARRAY_FOREACH(targetsToDelete1, jts)
    {
		CCSprite* target = dynamic_cast<CCSprite*>(jts);
        _projectiles->removeObject(target);
		this->removeChild(target, true);
	}
	targetsToDelete1->release();


}
void HelloWorld::qiehuan(CCObject* pSender)
{
      
    CCDirector::sharedDirector()->replaceScene(jinru::scene());
 
}
//添加敌人
void HelloWorld::addTarget()
{
      paomo = NULL;
    int suiji=arc4random()%3;
	if (suiji == 0)
	{
		paomo = WeakAndFastMonster::monster();
	}
    else if (suiji == 1)
	{
		paomo = StrongAndSlowMonster::monster();
	}
    else
    {
        paomo = VStrongAndVSlowMonster::monster();
    }
    
    

    int screwid=screensize.width;
    int actualX=arc4random()%screwid;
    int screhei=screensize.width;
    int actualY=arc4random()%screhei;
    
    int minDuration = paomo->getMinMoveDuration();
	int maxDuration = paomo->getMaxMoveDuration();
    
	int rangeDuration = maxDuration - minDuration;
	int actualDuration = (arc4random() % rangeDuration) + minDuration;
  	paomo->setPosition(CCPointMake(actualX,actualY));
    paomo->runAction(CCMoveTo::create(actualDuration,waff->getPosition()));

    

    

    
	if (paomo->getTag()==1) {
         paomo->runAction(CCScaleTo::create(1, 0.8));
    }
    if (paomo->getTag()==2) {
        CCRotateBy* rotate = CCRotateBy::actionWithDuration(1, 360);
        CCRepeatForever* repeatRotate = CCRepeatForever::create(rotate);
        paomo->runAction(repeatRotate);
    }
   
    
	this->addChild(paomo);
    //将敌人添加到targets容器
	_targets->addObject(paomo);
}


//清除屏幕外面的子弹
void HelloWorld::qingchu(float dt)
{
//    it = NULL;
//    
//    
//    //for (it = _projectiles->begin(); it != _projectiles->end(); it++)
//    bool sss;
//    CCARRAY_FOREACH(_projectiles, it)
//    {
//        
//        CCSprite *projectile = dynamic_cast<CCSprite*>(it);
////    if (projectile->getPosition().x<0-projectile->getContentSize().width/2||projectile->getPosition().x>screensize.width+projectile->getContentSize().width/2||projectile->getPosition().y<0-projectile->getContentSize().height/2||projectile->getPosition().y>screensize.height+projectile->getContentSize().height/2) {
////        this->removeChild(projectile, YES);
////
////    }
//    }
}
CCAnimation* HelloWorld::animationWithSingleFramess(const char *name, int count, float delay)
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
//void HelloWorld::xiayiguan()
//{
//    CCDirector::sharedDirector()->replaceScene(HelloWorld::scene());
//}
//上
void HelloWorld::MyButDown_top(CCObject* pSender)
{
    m_bMoveleft=false;
    m_bMoveright=false;
    m_bMoveup=false;
	m_bMovetop = true;
}

void HelloWorld::MyButUp_top(CCObject* pSender)
{
	m_bMovetop = false;
}

void HelloWorld::MyButDown_left(CCObject* pSender)
{
    m_bMoveright=false;
    m_bMoveup=false;
	m_bMovetop = false;
	m_bMoveleft = true;
}

void HelloWorld::MyButUp_left(CCObject* pSender)
{
	m_bMoveleft = false;
}
void HelloWorld::MyButDown_right(CCObject* pSender)
{
    m_bMoveup=false;
	m_bMovetop = false;
	m_bMoveleft = false;
	m_bMoveright = true;
}

void HelloWorld::MyButUp_right(CCObject* pSender)
{
	m_bMoveright = false;
}
//下
void HelloWorld::MyButDown_up(CCObject* pSender)
{
    m_bMovetop = false;
	m_bMoveleft = false;
	m_bMoveright = false;
	m_bMoveup = true;
}

void HelloWorld::MyButUp_up(CCObject* pSender)
{
	m_bMoveup = false;
}
void HelloWorld::ccTouchesBegan(CCSet* touches, CCEvent* event)
{
    

    CCSetIterator iter = touches->begin();
    for (; iter != touches->end(); iter++)
    {
        CCTouch* pTouch = (CCTouch*)(*iter);
    
	CCPoint location = pTouch->getLocationInView();
	location = CCDirector::sharedDirector()->convertToGL(location);
	yuandian=CCSprite::create("yuandian.png");
	
	yuandian->setPosition(CCPointMake(waff->getPosition().x,waff->getPosition().y));

	int offX=location.x-yuandian->getPosition().x;
	int offY=location.y-yuandian->getPosition().y;
	float radio=(float)offY/(float)offX;
    if (location.x>waff->getPosition().x) {
        realX=screensize.width+yuandian->getPosition().x/2;
    }
    if (location.x<waff->getPosition().x) {
        realX=-(yuandian->getPosition().x/2);
    }
	int reaY=(realX*radio)+yuandian->getPosition().y;
	CCPoint realDest=CCPointMake(realX,reaY);
	int realoffX=realX-yuandian->getPosition().x;
	int realoffY=reaY-yuandian->getPosition().y;
	float length=sqrtf((realoffX*realoffX)+(realoffY*realoffY));
	float velocity = 480/1; // 480pixels/1sec
	float realMoveDuration = length/velocity;
        yuandian->setVisible(true);
	yuandian->runAction(CCSequence::create((CCMoveTo::create(realMoveDuration,realDest)),NULL));
    _projectiles->addObject(yuandian);
        
        	this->addChild(yuandian);
        _yuandian=CCParticleSystemQuad::create(shiyinglizi());
        _yuandian->setScale(1);
        _yuandian->setPositionType(kCCPositionTypeFree);
        _yuandian->setAutoRemoveOnFinish(true);
        _yuandian->setPosition(ccp(0,0));
         _yuandian->setVisible(true);
        yuandian->addChild(_yuandian,111);
//               _yuandian->setPosition(yuandian->getPosition());
//       
//        _yuandian->runAction(CCMoveTo::create(realMoveDuration,realDest));
//       
//        this->addChild(_yuandian,-1);
    
    }

    
}

void HelloWorld::shootzidan()
{
    
}
void HelloWorld::didAccelerate(CCAcceleration *pAccelerationValue)
{
  
//    if (pAccelerationValue->x<0) {
//        m_bMovetop = false;
//        m_bMoveright=false;
//        m_bMoveup=false;
//        m_bMoveleft=true;
//   
//    }
//    
//    if (pAccelerationValue->x>=0) {
//        m_bMovetop = false;
//        m_bMoveleft=false;
//         m_bMoveup=false;
//         m_bMoveright=true;
//      
//    }

}


