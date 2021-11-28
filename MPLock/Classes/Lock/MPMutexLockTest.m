//
//  MPMutexLockTest.m
//  MPLock
//
//  Created by refrain on 2021/11/27.
//
// 互斥锁

#import "MPMutexLockTest.h"
#import <pthread.h>



@interface MPMutexLockTest ()

@property (nonatomic, assign) pthread_mutex_t ticketMutexLock;

@property (nonatomic, assign) pthread_mutex_t balanceMutexLock;


@end

@implementation MPMutexLockTest

- (void)dealloc{
    
    pthread_mutex_destroy(&_ticketMutexLock);
    
    pthread_mutex_destroy(&_balanceMutexLock);
}

- (instancetype)init{
    if (self = [super init]) {
        
        pthread_mutex_init(&_ticketMutexLock, NULL);
        
        pthread_mutex_init(&_balanceMutexLock, NULL);
        
    }
    return self;
}


- (void)saveMoney{
    
    pthread_mutex_lock(&_balanceMutexLock);
    
    [super saveMoney];
    
    pthread_mutex_unlock(&_balanceMutexLock);
    
    
}


- (void)spendMoney{
    
    pthread_mutex_lock(&_balanceMutexLock);
    
    [super spendMoney];
    
    pthread_mutex_unlock(&_balanceMutexLock);
    
}

- (void)saleTicked{
    
    pthread_mutex_lock(&_ticketMutexLock);
    
    [super saleTicked];
    
    pthread_mutex_unlock(&_ticketMutexLock);
    
}



@end
