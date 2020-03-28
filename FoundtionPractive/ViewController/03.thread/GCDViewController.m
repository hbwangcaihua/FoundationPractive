//
//  GCDViewController.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/2/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

//@property(nonatomic,strong) dispatch_semaphore_t b;

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"gcd";
    
//    [self testDispatchGroup];
    
//    [self performSelector:@selector(test:) withObject:nil afterDelay:2];

    //1. 子线程中延时执行：gcd,performSelector_after,NSTimer,NSThread中sleep
//    dispatch_queue_t a = dispatch_queue_create("xxxxxxxxx", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(a, ^{
//        [self performSelector:@selector(test:) withObject:nil afterDelay:2];
////        [self performSelectorOnMainThread:@selector(test:) withObject:nil waitUntilDone:YES];
//        [[NSRunLoop currentRunLoop] run];
//    });
    
//    //2. 信号量的使用：
//    dispatch_semaphore_t _b = dispatch_semaphore_create(0);
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_global_queue(2, 0), ^{
//        dispatch_semaphore_wait(_b, DISPATCH_TIME_FOREVER);
//        NSLog(@"wch-----------step1");
//    });
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_global_queue(2, 0), ^{
//        NSLog(@"wch-----------step2");
//        dispatch_semaphore_signal(_b);
//    });
    
}

-(void)test:(id)sender{
//    if([NSThread isMainThread]){
//        NSLog(@"wch-----------main");
//    } else {
//        NSLog(@"wch-----------no---main");
//    }
}

-(void)testDispatchGroup{

    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    
    dispatch_queue_t seriaQueue = dispatch_queue_create("xxxxxx", DISPATCH_QUEUE_SERIAL);
        
    dispatch_group_t group = dispatch_group_create();

    dispatch_group_enter(group);
    dispatch_async(seriaQueue, ^{
//        [NSThread sleepForTimeInterval:5];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), globalQueue, ^{
            NSLog(@"wch---------------0001");
            dispatch_group_leave(group);
        });
        
    });
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    
    dispatch_group_enter(group);
    dispatch_async(seriaQueue, ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), globalQueue, ^{
            NSLog(@"wch---------------0002");
            dispatch_group_leave(group);
        });
    });
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    dispatch_group_enter(group);
    dispatch_async(seriaQueue, ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), globalQueue, ^{
            NSLog(@"wch---------------0003");
            dispatch_group_leave(group);
        });
    });
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"wch---------------notify-----003");
 
    dispatch_group_notify(group, seriaQueue, ^{
        NSLog(@"wch---------------notify");
    });
}

@end
