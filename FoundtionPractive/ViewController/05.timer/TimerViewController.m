//
//  TimerViewController.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/5.
//  Copyright © 2020 wch. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@property(nonatomic,strong) CADisplayLink *displayLink;

@property(nonatomic,strong) dispatch_source_t sourceTimer;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"定时器";
    
//    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(repeat)];
//    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
//    _displayLink.preferredFramesPerSecond = 1;
    
    _sourceTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    //多久执行一次，允许出现的误差
    dispatch_source_set_timer(_sourceTimer, DISPATCH_TIME_NOW, 1*NSEC_PER_SEC, 0*NSEC_PER_SEC);
    dispatch_source_set_event_handler(_sourceTimer, ^{
        NSLog(@"wch----------------repeater");
    });
    //启动
    dispatch_resume(_sourceTimer);
//    dispatch_cancel(timer);
}

-(void)willMoveToParentViewController:(UIViewController *)parent{
    [_displayLink invalidate];
}


-(void)repeat{
    NSLog(@"wch-------------------repeat");
}

-(void)dealloc{
    NSLog(@"wch-------------------dealloc");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
