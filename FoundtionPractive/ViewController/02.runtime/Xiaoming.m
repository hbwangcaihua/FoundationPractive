//
//  Xiaoming.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/2/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "Xiaoming.h"

@interface Xiaoming(){
    NSString *chengyuanM;
    
    NSString *_chengyuanM;
}

@property(nonatomic,strong) NSString *xxxx;

@end

@implementation Xiaoming

+(void)initialize{
    NSLog(@"wch------------------xiaoming---initialize");
}

+(void)load{
    NSLog(@"wch------------------xiaoming---lod");
}

-(void)personEat{
    NSLog(@"wch-----------------xiaoming--Eat");
}

-(void)personEatAAAAAA{
    NSLog(@"wch-----------------xiaoming--Eat");
}

-(void)test{
    NSLog(@"wch----------------aaaaa---01:%@",_chengyuanM);
    NSLog(@"wch----------------aaaaa---02:%@",chengyuanM);
    
//    [self willChangeValueForKey:@"proSex"];
//    _proSex = @"test---edit";
//    [self didChangeValueForKey:@"proSex"];
}

-(void)valueForUndefinedKey:(NSString *)key{
    NSLog(@"wch-----------------valueForUndefinedKey:%@",key);
}

 - (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key{
    NSLog(@"wch-----------------undefined:%@",key);
 }
 
 
 + (BOOL) automaticallyNotifiesObserversForKey:(NSString *)key {
//     if ([key isEqualToString:@"age"]) {
//         return NO;
//     }
NSLog(@"wch-----------------key:%@",key);
     return [super automaticallyNotifiesObserversForKey:key];
 }

@end
