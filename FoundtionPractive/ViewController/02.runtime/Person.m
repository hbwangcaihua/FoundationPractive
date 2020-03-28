//
//  Person.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/2/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "TestViewModel2.h"

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

// +(BOOL)resolveInstanceMethod:(SEL)sel{
// NSLog(@"wch------------person----resolveInstanceMethod");
////     if(sel == @selector(ttttt)){
////         class_addMethod([self class], sel, (IMP)foo, "v@");
////     }
//     return [super resolveInstanceMethod:sel];
// }
//
// -(id)forwardingTargetForSelector:(SEL)aSelector{
//     NSLog(@"wch------------person----forwardingTargetForSelector");
//    return [super forwardingTargetForSelector:aSelector];
// }
//
// void foo(){
//     NSLog(@"wch------------person----foo");
// }
//
//
//-(NSMethodSignature*)methodSignatureForSelector:(SEL)selector
//{
//    NSLog(@"wch------------methodSignatureForSelector----foo");
//
////    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
////    if (! signature) {
////        //生成方法签名
////        TestViewModel2 *tVM = [[TestViewModel2 alloc] init];
////        signature = [tVM methodSignatureForSelector:selector];
////    }
////    return signature;
//
//    if(selector == @selector(ttttt)){
//        NSLog(@"wch------------methodSignatureForSelector----foo----222");
//        return [NSMethodSignature signatureWithObjCTypes:"V@:@"];
//    }
//    return [super methodSignatureForSelector:selector];
//}
//
//-(void)forwardInvocation:(NSInvocation *)anInvocation{
////    TestViewModel2 *tVM = [[TestViewModel2 alloc] init];
////    if([tVM respondsToSelector:anInvocation.selector]){
////        [anInvocation invokeWithTarget:tVM];
////    } else {
////        [self doesNotRecognizeSelector:anInvocation.selector];
////    }
//
//    NSLog(@"wch------------forwardInvocation----foo");
//
////    if( [anInvocation selector]==@selector(ttttt)){
////        NSLog(@"wch------------forwardInvocation----foo---2");
////        TestViewModel2 *tVM = [[TestViewModel2 alloc] init];
////        [anInvocation invokeWithTarget:tVM];
////    }
//
//    [super forwardInvocation:anInvocation];
//}
//
//-(void)doesNotRecognizeSelector:(SEL)aSelector{
//    NSLog(@"wch------------doesNotRecognizeSelector");
//
////    [super doesNotRecognizeSelector:aSelector];
//}


//-(NSMethodSignature*)methodSignatureForSelector:(SEL)selector
//{
//    NSLog(@"wch------------methodSignatureForSelector");
//
//    if(selector == @selector(ttttt)){
//        NSLog(@"wch------------methodSignatureForSelector----222");
//        return [NSMethodSignature signatureWithObjCTypes:"V@:@"];
//    }
//    return [super methodSignatureForSelector:selector];
//}
// 
//-(void)forwardInvocation:(NSInvocation *)anInvocation{
//    NSLog(@"wch------------forwardInvocation");
//    
////    if( [anInvocation selector]==@selector(ttttt)){
////        NSLog(@"wch------------forwardInvocation---2");
////        TestViewModel2 *tVM = [[TestViewModel2 alloc] init];
////        [anInvocation invokeWithTarget:tVM];
////    }
//
//    [super forwardInvocation:anInvocation];
//}

//-(void)doesNotRecognizeSelector:(SEL)aSelector{
//    NSLog(@"wch------------doesNotRecognizeSelector");
    
//    [super doesNotRecognizeSelector:aSelector];
//}

@end
