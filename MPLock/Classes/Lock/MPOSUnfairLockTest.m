//
//  MPOSUnfairLockTest.m
//  MPLock
//
//  Created by refrain on 2021/11/27.
//

#import "MPOSUnfairLockTest.h"
#import <os/lock.h>


@interface MPOSUnfairLockTest ()


@property (nonatomic, assign)os_unfair_lock balanceLock;

@property (nonatomic, assign)os_unfair_lock ticketLock;



@end



@implementation MPOSUnfairLockTest

- (instancetype)init{
    
    if (self = [super init]) {
        
        self.balanceLock = OS_UNFAIR_LOCK_INIT;
        
        self.ticketLock = OS_UNFAIR_LOCK_INIT;
    }
    
    return self;
    
}

- (void)saleTicked{
    
    
    os_unfair_lock_lock(&_ticketLock);
    
    [super saleTicked];
    
    os_unfair_lock_unlock(&_ticketLock);
    
    
}



@end
