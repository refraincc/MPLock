//
//  MPSemaphoreTest.m
//  MPLock
//
//  Created by refrain on 2021/11/28.
//

#import "MPSemaphoreTest.h"

@interface MPSemaphoreTest ()


@property (nonatomic, strong)dispatch_semaphore_t semaphore;

@property (nonatomic, strong)dispatch_semaphore_t ticketSemaphore;

@property (nonatomic, strong)dispatch_semaphore_t balanceSemaphore;



@end



@implementation MPSemaphoreTest

- (instancetype)init{
    if (self = [super init]) {
        
        self.semaphore = dispatch_semaphore_create(5);
        
        self.ticketSemaphore = dispatch_semaphore_create(1);
        
        self.balanceSemaphore = dispatch_semaphore_create(1);
        
        
    }
    return self;
}

- (void)saveMoney{
    
    dispatch_semaphore_wait(self.balanceSemaphore, DISPATCH_TIME_FOREVER);
    
    [super saveMoney];
    
    dispatch_semaphore_signal(self.balanceSemaphore);
    
    
}



- (void)spendMoney{
    
    dispatch_semaphore_wait(self.balanceSemaphore, DISPATCH_TIME_FOREVER);
    
    [super spendMoney];
    
    dispatch_semaphore_signal(self.balanceSemaphore);
    
}


- (void)saleTicked{
    
    dispatch_semaphore_wait(self.ticketSemaphore, DISPATCH_TIME_FOREVER);
    
    [super saleTicked];
    
    dispatch_semaphore_signal(self.ticketSemaphore);
    
}


- (void)otherTest{
    
    for (int i = 0; i < 20; i++) {
        
        [[[NSThread alloc] initWithTarget:self selector:@selector(test) object:nil] start];
        
        
    }
    
}


- (void)test{
    
    // 如果信号量的值 > 0，就让信号量的值减1，然后继续往下执行代码
    // 如果信号量的值 <= 0，就会休眠等待，直到信号量的值变成>0，就让信号量的值减1，然后继续往下执行代码
    // 当信号量大于0的时候，才会执行下面的代码 dispatch_semaphore_signal让信号量+1
    //
    
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    
    NSLog(@"%@", [NSThread currentThread]);
    
    sleep(2);
    
    dispatch_semaphore_signal(self.semaphore);
    

}



@end
