//
//  BlockViewController.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/3.
//  Copyright © 2020 wch. All rights reserved.
//

#import "BlockViewController.h"
#import "Xiaoming.h"

@interface BlockViewController ()

//@property(nonatomic,strong) Xiaoming *xm;

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    const int aaa = 4;
    
    Xiaoming *_xm = [[Xiaoming alloc] init];
    
    int age = 1;
    void(^test)(NSString *) = ^(NSString *param){
        NSLog(@"wch-------------test:%ld",aaa);
    };
    
    NSLog(@"%@",[test class]);
    NSLog(@"%@",[[test class] superclass]);
    NSLog(@"%@",[[[test class] superclass] superclass]);
    NSLog(@"%@",[[[[test class] superclass] superclass] superclass]);
    NSLog(@"%@",[[[[[test class] superclass] superclass] superclass] superclass]);
    
    
    NSLog(@"%@",[^(NSString *param){
        NSLog(@"wch-------------test:%ld",age);
    } class]);
    
//    int age = 10;  //auto局部变量
    void(^block2)(void) = ^{
        NSLog(@"age = %d",age);
    };
    NSLog(@"sss%@",[block2 class]);
    
    
}


@end
