//
//  NSOperationViewController.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/2/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "NSOperationViewController.h"

@interface NSOperationViewController ()

@end

@implementation NSOperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"NSOperation";
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
//    operationQueue.maxConcurrentOperationCount = 3;
    
//    NSBlockOperation *blockOperaion = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"wch-------ope--001:%@",[NSThread currentThread]);
//    }];
//    [blockOperaion addExecutionBlock:^{
//        NSLog(@"wch-------ope--execute:%@",[NSThread currentThread]);
//    }];
//    [blockOperaion setCompletionBlock:^{
//        NSLog(@"wch-------ope--completion:%@",[NSThread currentThread]);
//    }];
    
    [operationQueue addOperationWithBlock:^{
        NSLog(@"第一个任务:%@",[NSThread currentThread]);
    }];
    
    [operationQueue addOperationWithBlock:^{
        NSLog(@"第二个任务:%@",[NSThread currentThread]);
    }];
    
    [operationQueue addOperationWithBlock:^{
        NSLog(@"第三个任务:%@",[NSThread currentThread]);
    }];
    
    [operationQueue addOperationWithBlock:^{
        NSLog(@"第四个任务:%@",[NSThread currentThread]);
    }];
    
    [operationQueue addOperationWithBlock:^{
        NSLog(@"第五个任务:%@",[NSThread currentThread]);
    }];
    
    [operationQueue addOperationWithBlock:^{
        NSLog(@"第六个任务:%@",[NSThread currentThread]);
    }];
    
    [operationQueue addOperationWithBlock:^{
        NSLog(@"第七个任务:%@",[NSThread currentThread]);
    }];
    
//    [blockOperaion start];
    
//    [operationQueue addOperation:blockOperaion];
}

@end
