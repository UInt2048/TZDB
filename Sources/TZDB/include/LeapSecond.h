//
//  LeapSecond.h
//  TZDB
//
//  Created by Matthew Benedict on 2025/12/01.
//


#ifndef LeapSecond_h
#define LeapSecond_h

#import <Foundation/Foundation.h>

#ifdef __cplusplus
#define EXTERN_C       extern "C"
#define EXTERN_C_BEGIN extern "C" {
#define EXTERN_C_END   }
#else
#define EXTERN_C       /* Nothing */
#define EXTERN_C_BEGIN /* Nothing */
#define EXTERN_C_END   /* Nothing */
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NSArray<NSNumber *> LeapSecond;
typedef NSArray<LeapSecond *> LeapSeconds;

EXTERN_C_BEGIN

NSString* getTZVersion();
LeapSeconds* getLeapSecond();

EXTERN_C_END

NS_ASSUME_NONNULL_END

#endif // !LeapSecond_h

