//
//  NSNotificationCenter+Test.h
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/12.
//  Copyright © 2020 wch. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (Test)

- (void)removeObserver:(id)observer;
- (void)removeObserver:(id)observer name:(nullable NSNotificationName)aName object:(nullable id)anObject;

@end

NS_ASSUME_NONNULL_END
