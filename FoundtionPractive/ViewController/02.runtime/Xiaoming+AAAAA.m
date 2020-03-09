//
//  Xiaoming+AAAAA.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/2/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "Xiaoming+AAAAA.h"
#import <objc/runtime.h>

@implementation Xiaoming (AAAAA)

+(void)initialize{
    NSLog(@"wch------------------AAAAAAAAA---initialize");
}

+(void)load{
    NSLog(@"wch------------------AAAAAAAAA---lod");
}

-(void)test{
NSLog(@"wch------------------AAAAAAAAA---test");
}

- (void)setAaaaPro:(NSString *)aaaaPro {
     objc_setAssociatedObject(self,"name", aaaaPro,   OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)aaaaPro {
    
    return objc_getAssociatedObject(self,"name");
}

@end
