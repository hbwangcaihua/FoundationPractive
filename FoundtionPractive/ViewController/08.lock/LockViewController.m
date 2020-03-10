//
//  LockViewController.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/9.
//  Copyright © 2020 wch. All rights reserved.
//

#import "LockViewController.h"
#import <libkern/OSAtomic.h>

@interface LockViewController ()

@property(nonatomic,assign) NSInteger money;

// 锁
@property (nonatomic, assign) OSSpinLock lock;

@end

@implementation LockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化锁
    self.lock = OS_SPINLOCK_INIT;
    
    UIButton *runloopBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 74, 200, 40)];
    runloopBtn.backgroundColor = [UIColor grayColor];
    [runloopBtn setTitle:@"测试" forState:UIControlStateNormal];
    [runloopBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:runloopBtn];
}

-(void)buttonClick:(id)sender{

    self.money = 1000;

    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            [self saveMoney];
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            [self drawMoney];
        }
    });
}

// 存钱
- (void)saveMoney{
    OSSpinLockLock(&_lock);

    NSInteger oldMoney = self.money;
    sleep(0.5);
    oldMoney += 50;
    self.money = oldMoney;
    NSLog(@"存了50元，账户余额 %ld，当前线程 %@",self.money,[NSThread currentThread]);
    
    OSSpinLockUnlock(&_lock);
}

// 取钱
- (void)drawMoney{
    OSSpinLockLock(&_lock);

    NSInteger oldMoney = self.money;
    sleep(0.5);
    oldMoney -= 20;
    self.money = oldMoney;
    NSLog(@"取了20元，账户余额 %ld，当前线程 %@",self.money,[NSThread currentThread]);
    
    OSSpinLockUnlock(&_lock);
}

@end
