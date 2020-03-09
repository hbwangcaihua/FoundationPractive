//
//  CustomUIView.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/2/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "CustomUIView.h"
#import <objc/objc.h>
#import <objc/runtime.h>

@implementation CustomUIView

@synthesize aaa;

-(void)lay{
//    [self layoutIfNeeded];
    
    NSLog(@"wch----------------lay---%@",self.aaa);
}

- (void)layoutSubviews {
    NSLog(@"wch----------------layoutsubview");
}


-(void)drawRect:(CGRect)rect{
NSLog(@"wch----------------drawRect");
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context,[UIColor redColor].CGColor);//线条颜色
    //左侧填充色
//    if(self.leftFillColor){
        CGContextSetFillColorWithColor(context,[UIColor greenColor].CGColor);
        CGContextMoveToPoint(context, 0, rect.size.height);
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 40,0);
        CGContextAddLineToPoint(context, 40, rect.size.height);
        CGContextAddLineToPoint(context, 0,rect.size.height);
        CGContextFillPath(context);
//    }
//    //右侧侧填充色
//    if(self.rightFillColor){
//        CGContextSetFillColorWithColor(context,self.rightFillColor.CGColor);
//        CGContextMoveToPoint(context, self.leftCellWidth, rect.size.height);
//        CGContextAddLineToPoint(context, self.leftCellWidth,0);
//        CGContextAddLineToPoint(context, rect.size.width, 0);
//        CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
//        CGContextAddLineToPoint(context, self.leftCellWidth, rect.size.height);
//        CGContextFillPath(context);
//    }
//
//    //边框线，除了下部分
//    CGContextSetLineWidth(context, SINGLE_LINE_WIDTH);
//    CGContextMoveToPoint(context, 0, rect.size.height);
//    CGContextAddLineToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, rect.size.width,0);
//    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
//    CGContextStrokePath(context); //开始画线
//
//    //中间分割线
//    CGContextSetLineWidth(context, SINGLE_LINE_WIDTH);
//    CGContextMoveToPoint(context, self.leftCellWidth,0);
//    CGContextAddLineToPoint(context, self.leftCellWidth, rect.size.height);
//    CGContextStrokePath(context); //开始画线
//
//    //我是底线
//    if(self.isDreatBottomLine){
//        CGContextSetLineWidth(context, SINGLE_LINE_WIDTH);
//        CGContextMoveToPoint(context, 0,rect.size.height);
//        CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
//        CGContextStrokePath(context); //开始画线
//    }
}

//+ (void)load
//{
//    {
//        Method originInstanceMethod = class_getInstanceMethod([UIApplication class], @selector(hitTest:withEvent:));
//        Method newInstanceMethod = class_getInstanceMethod([self class], @selector(myhitTest:withEvent:));
//        class_addMethod([UIView class], @selector(myhitTest:withEvent:), newInstanceMethod, method_getTypeEncoding(originInstanceMethod));
//
//        IMP mySendEventIMP = method_getImplementation(newInstanceMethod);
//        IMP oldIMP = class_replaceMethod([UIView class], @selector(hitTest:withEvent:), mySendEventIMP, method_getTypeEncoding(originInstanceMethod));
//
//        class_replaceMethod([UIView class], @selector(myhitTest:withEvent:), oldIMP, method_getTypeEncoding(originInstanceMethod));
//    }
//}
//
//- (UIView *)myhitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
////        [UIAlertView showAlertView:nil message:@"test" delgt:nil cancelTitle:@"取消" otherTilte:@"确定"];
//    });
//    UIView *view = [self myhitTest:point withEvent:event];
//
//    if([view isKindOfClass:[UIButton class]]){
//        NSString *a = @"";
//    }
//
//    return view;
//}

@end
