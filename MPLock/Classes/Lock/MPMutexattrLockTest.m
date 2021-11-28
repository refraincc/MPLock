//
//  MPMutexattrLockTest.m
//  MPLock
//
//  Created by refrain on 2021/11/27.
//

#import "MPMutexattrLockTest.h"
#import <pthread.h>

@interface MPMutexattrLockTest ()


@property (nonatomic, assign)pthread_mutex_t mutex;


@end



@implementation MPMutexattrLockTest

- (void)dealloc{
    
    pthread_mutex_destroy(&_mutex);
    
}


- (instancetype)init{
    if (self = [super init]) {
        
        // 递归锁： 允许同一个线程对一把锁进行重复加锁
        
        // 初始化属性
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
        
        // 初始化锁
        pthread_mutex_init(&_mutex, &attr);
        
        // 销毁属性
        pthread_mutexattr_destroy(&attr);
    }
    return self;
}


- (void)otherTest {
    
    pthread_mutex_lock(&_mutex);
    
    NSLog(@"%s", __func__);
    
    static int count = 0;
    
    if (count < 10) {
        count++;
        [self otherTest];
    }
    
    pthread_mutex_unlock(&_mutex);
    
}



@end
