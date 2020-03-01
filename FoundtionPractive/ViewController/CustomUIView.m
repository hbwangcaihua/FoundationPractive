//
//  CustomUIView.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/2/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "CustomUIView.h"

@implementation CustomUIView

-(void)lay{
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    NSLog(@"wch----------------layoutsubview");
}

@end
