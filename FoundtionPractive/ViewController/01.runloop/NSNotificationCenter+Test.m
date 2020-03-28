//
//  NSNotificationCenter+Test.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/12.
//  Copyright © 2020 wch. All rights reserved.
//

#import "NSNotificationCenter+Test.h"

@implementation NSNotificationCenter (Test)

- (void)removeObserver:(id)observer{
NSLog(@"wch------------------001");
}
- (void)removeObserver:(id)observer name:(nullable NSNotificationName)aName object:(nullable id)anObject{
    NSLog(@"wch------------------002");

}


@end
