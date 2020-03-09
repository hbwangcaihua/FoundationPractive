//
//  RunloopViewController.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/2/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "RunloopViewController.h"
#import "WeakTimer.h"

@interface RunloopViewController ()

@property(nonatomic,strong) NSTimer *repeatTimer;

@end

@implementation RunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"RunLoop";
    
//    __weak typeof(self) weak_self = self;
//    [[NSNotificationCenter defaultCenter] addObserverForName:@"xxxxxxxxxx"
//                                                          object:nil
//                                                          queue:[NSOperationQueue mainQueue]
//                                                      usingBlock:^(NSNotification *note) {
//                                                         NSLog(@"wch------------------notification:%@",[NSThread isMainThread]?@"true":@"false");
//                                                         [weak_self repeat];
//                                                      }];
                     
//                     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(repeat) name:@"xxxxxxxxxx" object:nil];
   
//   dispatch_async(dispatch_get_global_queue(2, 0), ^{
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"xxxxxxxxxx" object:nil];
//});
    
    //1.timerWithTimeInterval需要加入到NSRunLoop
//    NSTimer *a = [NSTimer timerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
////        NSLog(@"wch------------------0001");
//    }];
//    [[NSRunLoop mainRunLoop] addTimer:a forMode:NSDefaultRunLoopMode];
    
    
    //2. NSTimer造成循环引用：willMoveToParentViewController中停止timer，WeakTimer弱引用self
//    _repeatTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(repeat) userInfo:nil repeats:YES];
////    _repeatTimer = [WeakTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(repeat) userInfo:nil repeats:YES];


    //3. NSRunLoop线程保活
//    dispatch_queue_t a = dispatch_queue_create("xxxxxxxxx", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(a, ^{
//        //           [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotification" object:@"通知发送了"];
//        [[NSNotificationQueue defaultQueue] enqueueNotification:[NSNotification notificationWithName:@"kNotification" object:@"通知发送了"] postingStyle:NSPostWhenIdle];
////                [self performSelector:@selector(ttt:) withObject:nil afterDelay:10];
//
//        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
//        [runLoop addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
//        [runLoop run];
//        //[NSMachPort port]
//    });
}

//-(void)willMoveToParentViewController:(UIViewController *)parent{
//    [_repeatTimer invalidate];
//}

-(void)repeat{
    NSLog(@"wch------------------repeat");
}

-(void)dealloc{
    NSLog(@"wch------------------dealloc");
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
