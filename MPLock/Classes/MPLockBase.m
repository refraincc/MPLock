//
//  MPLockBase.m
//  MPLock
//
//  Created by refrain on 2021/11/27.
//

#import "MPLockBase.h"

@interface MPLockBase ()


@property (nonatomic, assign)NSInteger balance;

@property (nonatomic, assign)NSInteger ticketsCount;



@end

@implementation MPLockBase

- (void)otherTest{
    
    [[NSThread alloc] initWithTarget:self selector:@selector(add) object:nil];
    
    [[NSThread alloc] initWithTarget:self selector:@selector(remove) object:nil];
}

- (void)add{
    
}

- (void)remove{
    
}



- (void)bankTest{
    
    self.balance = 100;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self saveMoney];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self spendMoney];
        }
    });
    
}

- (void)saveMoney{
    
    NSInteger oldMoney = self.balance;
    
    sleep(2.0);
    
    oldMoney += 50;
    
    self.balance = oldMoney;
    
    
    NSLog(@"存款50， 余额%ld   当前线程 = %@", self.balance, [NSThread currentThread]);
    
}


- (void)spendMoney{
    
    NSInteger oldMoney = self.balance;
    
    sleep(2.0);
    
    oldMoney -= 40;
    
    self.balance = oldMoney;
    
    
    NSLog(@"提款40， 余额%ld   当前线程 = %@", self.balance, [NSThread currentThread]);
    
}


- (void)saleTicketTest{
    
    self.ticketsCount = 15;
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    

    dispatch_async(queue, ^{
       
        for (int i = 0; i < 5; i++) {
            [self saleTicked];
        }

    });
    
    dispatch_async(queue, ^{
       
        for (int i = 0; i < 5; i++) {
            [self saleTicked];
        }

    });
    
    dispatch_async(queue, ^{
       
        for (int i = 0; i < 5; i++) {
            [self saleTicked];
        }

    });
    
    
}


- (void)saleTicked{
    
    
    
    NSInteger ticked = self.ticketsCount;
    
    sleep(2.0);
    
    ticked--;
    
    self.ticketsCount = ticked;
    
    
    NSLog(@"卖票-1， 余票%ld   当前线程 = %@", self.ticketsCount, [NSThread currentThread]);
    
    
}

@end
