//
//  RunloopViewController.h
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/2/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import <UIKit/UIKit.h>

//放在.h为全局静态变量，放在.m为局部静态变量
static NSString *aaaa = @"1223455";

NS_ASSUME_NONNULL_BEGIN

@interface RunloopViewController : UIViewController



@property(nonatomic,copy) NSString *testStringUseStrong;

@end

NS_ASSUME_NONNULL_END
