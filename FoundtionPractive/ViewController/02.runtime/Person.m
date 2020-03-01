//
//  Person.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/2/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "Person.h"

@interface Person(){
    NSString *PersonM;
}

@end

@implementation Person

+(void)initialize{
    NSLog(@"wch------------------Person---initialize");
}

+(void)load{
    NSLog(@"wch------------------Person---lod");
}

-(void)personEat{
    NSLog(@"wch-----------------personEat");
}

-(void)eat{
    NSLog(@"wch-----------------eat");
}

@end
