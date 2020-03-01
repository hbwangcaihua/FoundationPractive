//
//  WeakTimer.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/2/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "WeakTimer.h"

@implementation WeakTimer

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo{

    WeakTimer *w = [[WeakTimer alloc] init];
    w.target = aTarget;
    w.selector = aSelector;

    NSTimer *_repeatTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:w selector:@selector(repeat) userInfo:nil repeats:YES];
    return _repeatTimer;
}

-(void)repeat{
    [self.target performSelector:self.selector];
}

@end
