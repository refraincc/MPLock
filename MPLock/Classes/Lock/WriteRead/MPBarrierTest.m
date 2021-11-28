//
//  MPBarrierTest.m
//  MPLock
//
//  Created by refrain on 2021/11/28.
//

#import "MPBarrierTest.h"

@interface MPBarrierTest ()

@property (nonatomic, strong)dispatch_queue_t barrierQueue;

@end


@implementation MPBarrierTest


- (instancetype)init{
    if (self = [super init]) {
        self.barrierQueue = dispatch_queue_create("barrierQueue", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}


- (void)otherTest{
    
    
    for (int i = 0; i < 20; i++) {
        
        dispatch_async(self.barrierQueue, ^{
            [self read];
        });
        
            
        dispatch_async(self.barrierQueue, ^{
            [self read];
        });
        
    
        
        dispatch_async(self.barrierQueue, ^{
            [self read];
        });
        
        
        dispatch_barrier_async(self.barrierQueue, ^{
            [self write];
        });
        
            
    }
    
    
}

- (void)read{
    
    sleep(0.5);
    
    NSLog(@"%s", __func__);
}

- (void)write{
    
    sleep(2);
    
    NSLog(@"%s", __func__);
    
}


@end
