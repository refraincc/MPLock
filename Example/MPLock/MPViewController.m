//
//  MPViewController.m
//  MPLock
//
//  Created by refrain on 11/27/2021.
//  Copyright (c) 2021 refrain. All rights reserved.
//

#import "MPViewController.h"
#import "MPLockBase.h"
#import "MPOSSpinLockTest.h"
#import "MPMutexattrLockTest.h"
#import "MPMutexArrayTest.h"
#import "MPNSConditionLockTest.h"
#import "MPSemaphoreTest.h"
#import "MPBarrierTest.h"
#import "MPPthreadRWTest.h"

@interface MPViewController ()


@property (nonatomic, strong)MPMutexArrayTest *testModel;


@end

@implementation MPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.testModel = [[MPPthreadRWTest alloc] init];
    
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [self.testModel bankTest];
    
    
    [self.testModel otherTest];
    
//    [self.testModel saleTicketTest];
    
}


@end
