//
//  goumai.m
//  shuiguorenzhexin
//
//  Created by gq on 12-12-28.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "goumai.h"


#define ProductID_IAP0p99 @"increaseatck"//$0.99
#define ProductID_IAP1p99 @"increaseattack2" //$1.99
#define ProductID_IAP4p99 @"increase3" //$4.99


@implementation goumai
static goumai *sharedHelper = nil;
+(goumai *) sharedgoumai
{
    if (!sharedHelper) {
        sharedHelper = [[goumai alloc] init];
    }
    return sharedHelper;
}

//保存游戏数据
//参数介绍：
//   (NSMutableArray *)data ：保存的数据
//   (NSString *)fileName ：存储的文件名
-(BOOL) saveGameData:(NSMutableArray *)data  saveFileName:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    if (!documentsDirectory) {
        NSLog(@"Documents directory not found!");
        return NO;
    }
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:fileName];
    return ([data writeToFile:appFile atomically:YES]);
}
//读取游戏数据
//参数介绍：
//   (NSString *)fileName ：需要读取数据的文件名
-(id) loadGameData:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:fileName];
    NSMutableArray *myData = [[[NSMutableArray alloc] initWithContentsOfFile:appFile] autorelease];
    return myData;
}

-(void)buy1
{
     [self buy:IAP0p99];
}
-(void)buy2
{
    [self buy:IAP1p99];
}
-(void)buy3
{
    [self buy:IAP4p99];
}

-(void)buy:(int)type
{
    buyType = type;
    if ([SKPaymentQueue canMakePayments]) {
        //[[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
        [self RequestProductData];
        CCLOG("允许程序内付费购买");
    }
    else
    {
        CCLOG("不允许程序内付费购买");
        UIAlertView *alerView =  [[UIAlertView alloc] initWithTitle:@"Alert"
                                                            message:@"You can‘t purchase in app store（New Miracle说你没允许应用程序内购买）"
                                                           delegate:nil cancelButtonTitle:NSLocalizedString(@"Close（关闭）",nil) otherButtonTitles:nil];
        
        [alerView show];
        [alerView release];
        
    }
}

-(bool)CanMakePay
{
    return [SKPaymentQueue canMakePayments];
}

-(void)RequestProductData
{
    CCLOG("---------请求对应的产品信息------------");
    NSArray *product = nil;
    switch (buyType) {
        case IAP0p99:
            product=[[NSArray alloc] initWithObjects:ProductID_IAP0p99,nil];
         
            break;
        case IAP1p99:
            product=[[NSArray alloc] initWithObjects:ProductID_IAP1p99,nil];
           

            break;
        case IAP4p99:
           
            product=[[NSArray alloc] initWithObjects:ProductID_IAP4p99,nil];
            break;
   
        default:
            break;
    }
    NSSet *nsset = [NSSet setWithArray:product];
    SKProductsRequest *request=[[SKProductsRequest alloc] initWithProductIdentifiers: nsset];
    request.delegate=self;
    [request start];
    [product release];
}
//<SKProductsRequestDelegate> 请求协议
//收到的产品信息
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    
    NSLog(@"-----------收到产品反馈信息--------------");
    NSArray *myProduct = response.products;
    NSLog(@"产品Product ID:%@",response.invalidProductIdentifiers);
    NSLog(@"产品付费数量: %d", [myProduct count]);
    // populate UI
    for(SKProduct *product in myProduct){
        NSLog(@"product info");
        NSLog(@"SKProduct 描述信息%@", [product description]);
        NSLog(@"产品标题 %@" , product.localizedTitle);
        NSLog(@"产品描述信息: %@" , product.localizedDescription);
        NSLog(@"价格: %@" , product.price);
        NSLog(@"Product id: %@" , product.productIdentifier);
    }
    SKPayment *payment = nil;
    switch (buyType) {
        case IAP0p99:
            payment  = [SKPayment paymentWithProductIdentifier:ProductID_IAP0p99];    //支付$0.99
               panduangoumai=1;
            break;
        case IAP1p99:
            payment  = [SKPayment paymentWithProductIdentifier:ProductID_IAP1p99];    //支付$1.99
             panduangoumai=2;
            break;
        case IAP4p99:
            payment  = [SKPayment paymentWithProductIdentifier:ProductID_IAP4p99];    //支付$4.99
               panduangoumai=3;
            break;
            default:
            break;
    }
    CCLOG("---------发送购买请求------------");
    [[SKPaymentQueue defaultQueue] addPayment:payment];
    [request autorelease];
    
}
- (void)requestProUpgradeProductData
{
    CCLOG("------请求升级数据---------");
    NSSet *productIdentifiers = [NSSet setWithObject:@"com.productid"];
    SKProductsRequest* productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdentifiers];
    productsRequest.delegate = self;
    [productsRequest start];
    
}
//弹出错误信息
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error{
    CCLOG("-------弹出错误信息----------");
    UIAlertView *alerView =  [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Alert",NULL) message:[error localizedDescription]
                                                       delegate:nil cancelButtonTitle:NSLocalizedString(@"Close",nil) otherButtonTitles:nil];
    [alerView show];
    [alerView release];
}

-(void) requestDidFinish:(SKRequest *)request
{
    NSLog(@"----------反馈信息结束--------------");
    
}

-(void) PurchasedTransaction: (SKPaymentTransaction *)transaction{
    CCLOG("-----PurchasedTransaction----");
    NSArray *transactions =[[NSArray alloc] initWithObjects:transaction, nil];
    [self paymentQueue:[SKPaymentQueue defaultQueue] updatedTransactions:transactions];
    [transactions release];
}

//<SKPaymentTransactionObserver> 千万不要忘记绑定，代码如下：
//----监听购买结果
//[[SKPaymentQueue defaultQueue] addTransactionObserver:self];

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions//交易结果
{
    CCLOG("-----paymentQueue--------");
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchased://交易完成
            {
                [self completeTransaction:transaction];
                CCLOG("-----交易完成 --------");
                CCLOG("不允许程序内付费购买");
                UIAlertView *alerView =  [[UIAlertView alloc] initWithTitle:@"Alert"
                                                                    message:@"Purchasing success(购买成功)"
                                                                   delegate:nil cancelButtonTitle:NSLocalizedString(@"Close（关闭）",nil) otherButtonTitles:nil];
                if (panduangoumai==1) {
                   
                    NSMutableArray*temp =(NSMutableArray*)[self loadGameData:@"Miracle"];
                    CCLOG("%@",[temp objectAtIndex:0]);
                    int chushihuaInt;
                    if ([temp objectAtIndex:0]==nil) {
                        
                      chushihuaInt=0;
                        
                    }
                    else
                    {
                        
                       chushihuaInt=[[temp objectAtIndex:0] intValue];
                    }
                    int saveInt1= chushihuaInt+3;
                 NSNumber *saveStr1=[NSNumber numberWithInt:saveInt1];
                    
                    NSMutableArray *array = [NSMutableArray arrayWithObjects:saveStr1, nil];
                    [self saveGameData:array saveFileName:@"Miracle"];
                   
//                    DataModel *m=[DataModel getModel];
//                    m.daoguang=@"bluestreak.png";
                }
                if (panduangoumai==2) {
                    int saveInt2 = 10;
                    NSNumber *saveStr2=[NSNumber numberWithInt:saveInt2];
                    
                    
                    NSMutableArray *array = [NSMutableArray arrayWithObjects:saveStr2, nil];
                    [self saveGameData:array saveFileName:@"Miracle"];
//                    DataModel *m=[DataModel getModel];
//                    m.daoguang=@"redstreak.png";
                }
                if (panduangoumai==3) {
                    int saveInt3 = 20;
                    NSNumber *saveStr3=[NSNumber numberWithInt:saveInt3];
                    
                    
                    NSMutableArray *array = [NSMutableArray arrayWithObjects:saveStr3, nil];
                    [self saveGameData:array saveFileName:@"Miracle"];
//                    
//                    DataModel *m=[DataModel getModel];
//                    m.daoguang=@"colorfulstreak.png";
                }
              
                
                [alerView show];
                [alerView release];
            }
                break;
            case SKPaymentTransactionStateFailed://交易失败
            {
                [self failedTransaction:transaction];
                CCLOG("-----交易失败 --------");
                UIAlertView *alerView2 =  [[UIAlertView alloc] initWithTitle:@"Alert"
                                                                     message:@"The purchase of failure(购买失败)"
                                                                    delegate:nil cancelButtonTitle:NSLocalizedString(@"Close（关闭）",nil) otherButtonTitles:nil];
                
                [alerView2 show];
                [alerView2 release];
            }
                break;
            case SKPaymentTransactionStateRestored://已经购买过该商品
            {
                [self restoreTransaction:transaction];
                CCLOG("-----已经购买过该商品 --------");
            }
            case SKPaymentTransactionStatePurchasing:      //商品添加进列表
            {
                CCLOG("-----商品添加进列表 --------");
            }
                break;
            default:
                break;
//                013-01-10 21:18:08.318 shuiguorenzhexin[691:707] ---------请求对应的产品信息------------
//                2013-01-10 21:18:08.322 shuiguorenzhexin[691:707] 允许程序内付费购买
//                2013-01-10 21:18:17.560 shuiguorenzhexin[691:707] -----------收到产品反馈信息--------------
//                2013-01-10 21:18:17.561 shuiguorenzhexin[691:707] 产品Product ID:(
//                )
//                2013-01-10 21:18:17.562 shuiguorenzhexin[691:707] 产品付费数量: 1
//                2013-01-10 21:18:17.563 shuiguorenzhexin[691:707] product info
//                2013-01-10 21:18:17.564 shuiguorenzhexin[691:707] SKProduct 描述信息<SKProduct: 0x1fd2ad40>
//                2013-01-10 21:18:17.565 shuiguorenzhexin[691:707] 产品标题 七彩之光
//                2013-01-10 21:18:17.566 shuiguorenzhexin[691:707] 产品描述信息: 每切一次水果会获得额外10分
//                2013-01-10 21:18:17.566 shuiguorenzhexin[691:707] 价格: 30
//                2013-01-10 21:18:17.567 shuiguorenzhexin[691:707] Product id: fruitcolorful
//                2013-01-10 21:18:17.572 shuiguorenzhexin[691:707] ---------发送购买请求------------
//                2013-01-10 21:18:17.573 shuiguorenzhexin[691:707] -----paymentQueue--------
//                2013-01-10 21:18:17.574 shuiguorenzhexin[691:707] -----商品添加进列表 --------
//                2013-01-10 21:18:17.576 shuiguorenzhexin[691:707] ----------反馈信息结束--------------
//                2013-01-10 21:18:20.560 shuiguorenzhexin[691:707] cocos2d: animation stopped
//                2013-01-10 21:18:20.561 shuiguorenzhexin[691:707] cocos2d: animation started with frame interval: 4.00
//                2013-01-10 21:18:26.681 shuiguorenzhexin[691:707] cocos2d: animation stopped
//                2013-01-10 21:18:26.683 shuiguorenzhexin[691:707] cocos2d: animation started with frame interval: 60.00
//                2013-01-10 21:18:27.527 shuiguorenzhexin[691:707] -----paymentQueue--------
//                2013-01-10 21:18:27.528 shuiguorenzhexin[691:707] -----completeTransaction--------
//                2013-01-10 21:18:27.530 shuiguorenzhexin[691:707] -----记录交易--------
//                2013-01-10 21:18:27.530 shuiguorenzhexin[691:707] -----下载--------
//                2013-01-10 21:18:27.531 shuiguorenzhexin[691:707] -----交易完成 --------
//                2013-01-10 21:18:27.532 shuiguorenzhexin[691:707] 不允许程序内付费购买

        }
    }
}
- (void) completeTransaction: (SKPaymentTransaction *)transaction

{
    CCLOG("-----completeTransaction--------");
    // Your application should implement these two methods.
    NSString *product = transaction.payment.productIdentifier;
    if ([product length] > 0) {
        
        NSArray *tt = [product componentsSeparatedByString:@"."];
        NSString *bookid = [tt lastObject];
        if ([bookid length] > 0) {
            [self recordTransaction:bookid];
            [self provideContent:bookid];
        }
    }
    
    // Remove the transaction from the payment queue.
    
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    
}

//记录交易
-(void)recordTransaction:(NSString *)product{
    CCLOG("-----记录交易--------");
}

//处理下载内容
-(void)provideContent:(NSString *)product{
    CCLOG("-----下载--------");
}

- (void) failedTransaction: (SKPaymentTransaction *)transaction{
    NSLog(@"失败");
    if (transaction.error.code != SKErrorPaymentCancelled)
    {
    }
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    
    
}
-(void) paymentQueueRestoreCompletedTransactionsFinished: (SKPaymentTransaction *)transaction{
    
}

- (void) restoreTransaction: (SKPaymentTransaction *)transaction

{
    NSLog(@" 交易恢复处理");
    
}

-(void) paymentQueue:(SKPaymentQueue *) paymentQueue restoreCompletedTransactionsFailedWithError:(NSError *)error{
    CCLOG("-------paymentQueue----");
}


#pragma mark connection delegate
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"%@",  [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease]);
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    switch([(NSHTTPURLResponse *)response statusCode]) {
        case 200:
        case 206:
            break;
        case 304:
            break;
        case 400:
            break;
        case 404:
            break;
        case 416:
            break;
        case 403:
            break;
        case 401:
        case 500:
            break;
        default:
            break;
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"test");
}

-(void)dealloc
{
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];//解除监听
    [super dealloc];
}
@end