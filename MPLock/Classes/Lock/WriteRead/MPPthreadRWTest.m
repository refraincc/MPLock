//
//  MPPthreadRWTest.m
//  MPLock
//
//  Created by refrain on 2021/11/28.
//

#import "MPPthreadRWTest.h"
#import <pthread.h>



@interface MPPthreadRWTest ()


@property (nonatomic, assign)pthread_rwlock_t lock;



@end


@implementation MPPthreadRWTest

- (void)dealloc{
    pthread_rwlock_destroy(&_lock);
}


- (instancetype)init{
    if (self = [super init]) {
        
        pthread_rwlock_init(&_lock, NULL);
        
    }
    return self;
}

- (void)otherTest{
    
    dispatch_queue_t queue = dispatch_queue_create("MPPthreadRWTest", DISPATCH_QUEUE_CONCURRENT);
    
    
    for (int i = 0; i < 20; i++) {
        
        dispatch_async(queue, ^{
            [self read];
        });
        
        dispatch_async(queue, ^{
            [self write];
        });
        
    }
}



- (void)read{
    
    pthread_rwlock_rdlock(&_lock);
    
    sleep(0.5);
    
    NSLog(@"%s", __func__);
    
    
    pthread_rwlock_unlock(&_lock);
    
    
}

- (void)write{
    
    pthread_rwlock_wrlock(&_lock);
    
    sleep(2);
    
    NSLog(@"%s", __func__);
    
    pthread_rwlock_unlock(&_lock);
    
}




@end
