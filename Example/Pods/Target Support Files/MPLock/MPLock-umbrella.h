#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MPMutexArrayTest.h"
#import "MPMutexattrLockTest.h"
#import "MPMutexLockTest.h"
#import "MPNSConditionLockTest.h"
#import "MPNSConditionTest.h"
#import "MPNSLockTest.h"
#import "MPOSSpinLockTest.h"
#import "MPOSUnfairLockTest.h"
#import "MPSemaphoreTest.h"
#import "MPSerialQueueTest.h"
#import "MPLockBase.h"

FOUNDATION_EXPORT double MPLockVersionNumber;
FOUNDATION_EXPORT const unsigned char MPLockVersionString[];

