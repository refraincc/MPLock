//
//  MPOSSpinLockTest.m
//  MPLock
//
//  Created by refrain on 2021/11/27.
//
// 自旋锁


#import "MPOSSpinLockTest.h"
#import <libkern/OSAtomic.h>


@interface MPOSSpinLockTest ()

@property (nonatomic, assign)OSSpinLock balanceLock;


@property (nonatomic, assign)OSSpinLock ticketLock;


@end


@implementation MPOSSpinLockTest


- (instancetype)init{
    if (self = [super init]) {
        
        self.balanceLock = OS_SPINLOCK_INIT;
        
        self.ticketLock = OS_SPINLOCK_INIT;
        
    }
    return self;
}


- (void)saveMoney{
    
    OSSpinLockLock(&_balanceLock);
    
    [super saveMoney];
    
    OSSpinLockUnlock(&_balanceLock);
    
}

- (void)spendMoney{
    
    
    OSSpinLockLock(&_balanceLock);
    
    [super spendMoney];
    
    OSSpinLockUnlock(&_balanceLock);
    
}



- (void)saleTicked{
    
    
    OSSpinLockLock(&_ticketLock);
    
    [super saleTicked];
    
    OSSpinLockUnlock(&_ticketLock);
    
    
}




@end
