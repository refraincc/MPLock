//
//  MPSynchronizedTest.m
//  MPLock
//
//  Created by refrain on 2021/11/28.
//

#import "MPSynchronizedTest.h"

@implementation MPSynchronizedTest



- (void)saveMoney{
    
    @synchronized ([self class]) {
        [super saveMoney];
    }
    
}


- (void)spendMoney{
    
    @synchronized ([self class]) {
        [super spendMoney];
    }
    
}


- (void)saleTicked{
    static NSObject *lock;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lock = [[NSObject alloc] init];
    });
    
    @synchronized (lock) {
        [super saleTicked];
    }
}


- (void)otherTest{
    
    @synchronized ([self class]) {
        [self otherTest];
    }
    
}


@end
