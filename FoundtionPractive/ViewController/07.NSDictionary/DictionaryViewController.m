//
//  DictionaryViewController.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/9.
//  Copyright © 2020 wch. All rights reserved.
//

#import "DictionaryViewController.h"
#import "ParentObj.h"
#import "SonObject.h"
#import "NSString+testaa.h"

@interface DictionaryViewController ()

@end

@implementation DictionaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ParentObj *pa = [[ParentObj alloc] init];
    pa.pName = @"pName";
    
//    NSString *a = @"a";
//    
//    [a testExt];
//    a.strExtend = @"2222";
//
//    NSLog(@"wch-------------%@",a.strExtend);
    
//    NSLog(@"wch--------------NSMutableSet--1p%p",&pa);
//    NSLog(@"wch--------------NSMutableSet--1:%ld",[pa hash]);
    
//    //1. NSDictionary copy
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    [dic setObject:pa forKey:@"1"];
//
//    NSMutableDictionary *newDic = [[NSMutableDictionary alloc] initWithDictionary:dic copyItems:YES];
//    ParentObj *pa2 = [newDic objectForKey:@"1"];
//    pa2.pName = @"pName---2";
//
//    NSLog(@"wch--------------pa:%@",pa.pName);
//    NSLog(@"wch--------------pa2:%@",pa2.pName);

//    NSMutableSet *set = [[NSMutableSet alloc] init];
//    [set addObject:pa];
//
////    NSLog(@"wch--------------NSMutableSet--01:%ld",set.count);
//
//    ParentObj *pa2 = [[ParentObj alloc] init];
//    pa2.pName = @"pName2";
//    [set addObject:pa2];
//
//    ParentObj *pa3 = [[ParentObj alloc] init];
//    pa3.pName = @"pName3";
//    [set addObject:pa3];
//
//    ParentObj *pa4 = [[ParentObj alloc] init];
//    pa4.pName = @"pName7";
//    [set addObject:pa4];
//

//NSLog(@"wch--------------------ssss");
//    NSEnumerator *enumerator = [set objectEnumerator];
//    ParentObj *object  = [enumerator nextObject];
//    while (object != nil) {
//        NSLog(@"----------%@",object.pName);
//        object = [enumerator nextObject];
//    }
//
//    NSLog(@"wch-----------------------[set containsObject:pa2]:%@",[set containsObject:pa2]?@"true":@"false");
//    NSLog(@"wch-----------------------[set containsObject:pa3]:%@",[set containsObject:pa3]?@"true":@"false");
    
//    NSMutableDictionary *mulDic = [[NSMutableDictionary alloc] init];
////    [mulDic setObject:@"s" forKey:pa];
//
//    SonObject *sonObj = [[SonObject alloc] init];
//    sonObj.sonName = @"SonObject";
//    sonObj.parentObj = pa;
//
//    [mulDic setObject:@"wer" forKey:sonObj];
//
//    SonObject *sonObj2 = [[SonObject alloc] init];
//    sonObj2.sonName = @"SonObjectsfdf";
//    sonObj2.parentObj = pa;
//
//    [mulDic setObject:@"wer234234" forKey:sonObj2];
//
////    SonObject *sonObj3 = [[SonObject alloc] init];
////    sonObj3.sonName = @"SonObjec333333";
////    sonObj3.parentObj = pa;
////
////    [mulDic setObject:@"wer3333333" forKey:sonObj3];
//
////
//    NSLog(@"wch-------------------bbb---%ld", [mulDic allKeys].count );
//    NSString *a = [mulDic objectForKey:sonObj];
//    NSLog(@"wch-------------------a:%@",a);
//    NSString *b = [mulDic objectForKey:sonObj2];
//    NSLog(@"wch-------------------b:%@",b);
////    NSString *c = [mulDic objectForKey:sonObj3];
////    NSLog(@"wch-------------------c:%@",c);
//    NSLog(@"wch------------%@",mulDic);
}


@end
