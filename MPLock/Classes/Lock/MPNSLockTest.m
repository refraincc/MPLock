//
//  MPNSLockTest.m
//  MPLock
//
//  Created by refrain on 2021/11/28.
//

#import "MPNSLockTest.h"



@interface MPNSLockTest ()

@property (nonatomic, strong)NSLock *ticketLock;

@property (nonatomic, strong)NSLock *balanceLock;


@end


@implementation MPNSLockTest

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ticketLock = [[NSLock alloc] init];
        
        self.balanceLock = [[NSLock alloc] init];
    }
    return self;
}

- (void)saleTicked{
    
    [self.ticketLock lock];
    
    [super saleTicked];
    
    [self.ticketLock unlock];
    
    
}

- (void)saveMoney{
    
    [self.balanceLock lock];
    
    [super saveMoney];
    
    [self.balanceLock unlock];
    
}


- (void)spendMoney{
    
    [self.balanceLock lock];
    
    [super spendMoney];
    
    [self.balanceLock unlock];
    
}



@end
