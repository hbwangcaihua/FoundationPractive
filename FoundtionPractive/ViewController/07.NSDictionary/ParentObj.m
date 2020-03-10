//
//  ParentObj.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/9.
//  Copyright © 2020 wch. All rights reserved.
//

#import "ParentObj.h"

@implementation ParentObj

//-(id)copyWithZone:(NSZone *)zone{
//    ParentObj *obj = [[[self class] allocWithZone:zone] init];
//    obj.pName = self.pName;
//    return obj;
//}

-(BOOL)isEqual:(id)object{
NSLog(@"wch===================isEqual");
    return YES;
}
//
-(NSUInteger)hash{
NSLog(@"wch===================hash---%ld",self.pName.hash);
    return self.pName.hash;
}

@end
