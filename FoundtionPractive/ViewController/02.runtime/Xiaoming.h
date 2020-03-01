//
//  Xiaoming.h
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/2/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Xiaoming : Person{
    NSString *chengyuanH;
}

@property(nonatomic,strong) NSString *proSex;
@property(nonatomic,assign) int proAge;

-(void)test;

@end

NS_ASSUME_NONNULL_END
