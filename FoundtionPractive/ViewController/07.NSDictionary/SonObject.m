//
//  SonObject.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/9.
//  Copyright © 2020 wch. All rights reserved.
//

#import "SonObject.h"

@implementation SonObject

-(id)copyWithZone:(NSZone *)zone{
    SonObject *obj = [[[self class] allocWithZone:zone] init];
    obj.sonName = self.sonName;
    obj.parentObj = self.parentObj;
    return obj;
}

-(BOOL)isEqual:(id)object{
NSLog(@"wch-----------------isEqual");
    if ([object isKindOfClass:self.class] && [((SonObject *)object).sonName isEqualToString:self.sonName])
    {
        return YES;
    }
    return NO;
}

-(NSUInteger)hash{
    NSLog(@"wch-----------------hash");
    return self.sonName.hash;
}

@end
