//
//  SonObject.h
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/9.
//  Copyright © 2020 wch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParentObj.h"

NS_ASSUME_NONNULL_BEGIN

@interface SonObject : NSObject<NSCopying>

@property(nonatomic,strong) NSString *sonName;

@property(nonatomic,strong) ParentObj *parentObj;

@end

NS_ASSUME_NONNULL_END
