//
//  MPMutexArrayTest.m
//  MPLock
//
//  Created by refrain on 2021/11/27.
//

#import "MPMutexArrayTest.h"
#import <pthread.h>


@interface MPMutexArrayTest ()

@property (nonatomic, assign)pthread_mutex_t mutex;

// 条件
@property (nonatomic, assign)pthread_cond_t cond;

@property (nonatomic, strong)NSMutableArray *array;

@end



@implementation MPMutexArrayTest


- (void)dealloc{
    pthread_mutex_destroy(&_mutex);
    
    pthread_cond_destroy(&_cond);
}


- (instancetype)init{
    if (self = [super init]) {
        
        pthread_mutexattr_t attr;
        
        pthread_mutexattr_init(&attr);
        
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
        
        pthread_mutex_init(&_mutex, &attr);
        
        pthread_mutexattr_destroy(&attr);
        
        
        self.array = [NSMutableArray array];
        
    }
    return self;
}



- (void)otherTest{
    
    [super otherTest];
    
    
}


- (void)add{
    
    pthread_mutex_lock(&_mutex);
    
    sleep(1);
    
    NSLog(@"add begin");
    
    [self.array addObject:@"test"];
    
    NSLog(@"add end");
    
    // 信号
    pthread_cond_signal(&_cond);
    
    // 广播
    pthread_cond_broadcast(&_cond);
    
    pthread_mutex_unlock(&_mutex);
    
    
    
}

- (void)remove{
    
    
    pthread_mutex_lock(&_mutex);
    
    NSLog(@"remove begin");
    
    if (!self.array.count) {
        
        pthread_cond_wait(&_cond, &_mutex);
        
    }
    
    [self.array removeLastObject];
    NSLog(@"remove end");
    
    pthread_mutex_unlock(&_mutex);
    
}

@end
