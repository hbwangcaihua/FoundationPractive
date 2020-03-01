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
    operationQueue.maxConcurrentOperationCount = 5;
    
    NSBlockOperation *blockOperaion = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"wch--------------ope--001");
    }];
    [blockOperaion addExecutionBlock:^{
        NSLog(@"wch--------------ope--execute");
    }];
    [blockOperaion setCompletionBlock:^{
        NSLog(@"wch--------------ope--completion");
    }];
    
    [blockOperaion start];
    
//    [operationQueue addOperation:blockOperaion];
}

@end
