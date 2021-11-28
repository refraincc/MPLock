//
//  MPSerialQueueTest.m
//  MPLock
//
//  Created by refrain on 2021/11/28.
//

#import "MPSerialQueueTest.h"


@interface MPSerialQueueTest ()


@property (nonatomic, strong)dispatch_queue_t ticketQueue;

@property (nonatomic, strong)dispatch_queue_t balanceQueue;



@end


@implementation MPSerialQueueTest


- (instancetype)init{
    if (self = [super init]) {
        
        self.ticketQueue = dispatch_queue_create("ticketQueue", DISPATCH_QUEUE_SERIAL);
        
        self.balanceQueue = dispatch_queue_create("balanceQueue", DISPATCH_QUEUE_SERIAL);
        
    }
    return self;
}



- (void)saveMoney{
    
    dispatch_sync(self.balanceQueue, ^{
        [super saveMoney];
    });
    
}


-(void)spendMoney{
    
    dispatch_sync(self.balanceQueue, ^{
        [super spendMoney];
    });
    
}


- (void)saleTicked{
    
    dispatch_sync(self.ticketQueue, ^{
        [super saleTicked];
    });
    
}



@end
