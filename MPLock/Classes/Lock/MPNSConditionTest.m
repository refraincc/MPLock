//
//  MPNSConditionTest.m
//  MPLock
//
//  Created by refrain on 2021/11/28.
//

#import "MPNSConditionTest.h"

@interface MPNSConditionTest ()


@property (nonatomic, strong)NSCondition *condition;

@property (nonatomic, strong)NSMutableArray *array;


@end


@implementation MPNSConditionTest



- (instancetype)init{
    if (self = [super init]) {
        
        self.condition = [[NSCondition alloc] init];
        
        self.array = [NSMutableArray array];
        
        
    }
    return self;
}


- (void)add{
    
    [self.condition lock];
    
    sleep(1.0);
    
    [self.array addObject:@"1"];
    
    // 发送信号
    [self.condition signal];
    
    
    sleep(1.0);
    
    [self.condition unlock];
    
    
}

- (void)remove{
    
    [self.condition lock];
    
    if (!self.array.count) {
        
        [self.condition wait];
        
    }
    
    
    [self.array removeLastObject];
    
    [self.condition unlock];
    
    
}


@end
