//
//  goumai.h
//  shuiguorenzhexin
//
//  Created by gq on 12-12-28.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "cocos2d.h"
#import <UIKit/UIKit.h>

#import <StoreKit/StoreKit.h>

enum{
    IAP0p99=10,
    IAP1p99,
    IAP4p99,

}buyCoinsTag;

@interface goumai : NSObject<SKProductsRequestDelegate,SKPaymentTransactionObserver>
{
    int buyType;
    int panduangoumai;
    
}

+(goumai *) sharedgoumai;
- (void) requestProUpgradeProductData;
-(void)RequestProductData;
-(bool)CanMakePay;
-(void)buy1;
-(void)buy2;
-(void)buy3;
-(void)buy:(int)type;
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions;
-(void) PurchasedTransaction: (SKPaymentTransaction *)transaction;
- (void) completeTransaction: (SKPaymentTransaction *)transaction;
- (void) failedTransaction: (SKPaymentTransaction *)transaction;
-(void) paymentQueueRestoreCompletedTransactionsFinished: (SKPaymentTransaction *)transaction;
-(void) paymentQueue:(SKPaymentQueue *) paymentQueue restoreCompletedTransactionsFailedWithError:(NSError *)error;
- (void) restoreTransaction: (SKPaymentTransaction *)transaction;
-(void)provideContent:(NSString *)product;
-(void)recordTransaction:(NSString *)product;
-(id) loadGameData:(NSString *)fileName;
@end