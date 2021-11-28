//
//  MPNSConditionLockTest.m
//  MPLock
//
//  Created by refrain on 2021/11/28.
//

#import "MPNSConditionLockTest.h"

@interface MPNSConditionLockTest ()


@property (nonatomic, strong)NSConditionLock *conditionLock;


@end



@implementation MPNSConditionLockTest

- (instancetype)init{
    if (self = [super init]) {
        self.conditionLock = [[NSConditionLock alloc] initWithCondition:1];
    }
    return self;
}


- (void)otherTest{
    
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(oneFunc) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(twoFunc) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(threeFunc) object:nil] start];
    
    
}

- (void)oneFunc{
    
    [self.conditionLock lock];
    
    sleep(2.0);
    
    NSLog(@"%s", __func__);
    
    [self.conditionLock unlockWithCondition:2];
    
}



- (void)twoFunc{
    
    
    [self.conditionLock lockWhenCondition:2];
    
    sleep(1.0);
    
    NSLog(@"%s", __func__);
    
    [self.conditionLock unlockWithCondition:3];
    
}



- (void)threeFunc{
    
    
    [self.conditionLock lockWhenCondition:3];
    
    sleep(1.0);
    
    NSLog(@"%s", __func__);
    
    [self.conditionLock unlock];
    
}


@end
