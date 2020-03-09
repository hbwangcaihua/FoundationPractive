//
//  RunTimeViewController.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/2/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "RunTimeViewController.h"
#import "Xiaoming.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "Xiaoming+AAAAA.h"

@interface RunTimeViewController ()

@property(nonatomic,strong) Xiaoming *xm;

//autorelease在didappear中已被释放
@property(nonatomic,weak) NSString *weakString;

@end

@implementation RunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _xm = [[Xiaoming alloc] init];
    _xm.aaaaPro = @"aaaaPro";
    
//   _weakString = [NSString stringWithFormat:@"aaaaabbb"];
    
    //1. objc_msgSend
//    objc_msgSend(_xm,@selector(test3)); //使用这种方式，需要设置 Enable Strict为NO
//    ((id (*)(id, SEL))objc_msgSend)(xm, @selector(personEat));
//    ((id (*)(id, SEL))objc_msgSend)(xm, sel_registerName("personEat"));


//   //2. 动态创建类，并调用
//   const char * className;
//   className = [@"Student" UTF8String];
//   Class kclass = objc_getClass(className);
//   //判断此类是否已经存在，如果存在则返回，不存在就创建
//   if (!kclass)
//   {
//       Class superClass = [NSObject class];
//       kclass = objc_allocateClassPair(superClass, className, 0);
//
//       //添加属性
//       class_addIvar(kclass, "_stuName", sizeof(NSString *), 0, "@");
//       //添加方法
//       class_addMethod([kclass class], @selector(say:), (IMP)say, "v@:");
//   }
//
////   objc_registerClassPair(kclass);
//
//   //调用
//   id p = [[kclass alloc] init];
//    ((id (*)(id, SEL,id))objc_msgSend)(p, @selector(say:),@"23423");
    
    
    
    
//    //3. 遍历所有成员变量、方法
//    unsigned int outCount = 0;
//    Ivar *ivars = class_copyIvarList([_xm class], &outCount);
//    for(int i=0;i<outCount;i++){
//        Ivar ivar = ivars[i];
//        const char *name = ivar_getName(ivar);
//        const char *type = ivar_getTypeEncoding(ivar);
//        NSLog(@"wch------------%s,%s",name,type);
//    }

//    objc_property_t *props = class_copyPropertyList([_xm class], &outCount);
//    for(int i=0;i<outCount;i++){
//        objc_property_t prop = props[i];
//        const char *name = property_getName(prop);
//        NSLog(@"wch------------%s",name);
//    }

//
//    Method *methods = class_copyMethodList([_xm class], &outCount);
//    for(int i=0;i<outCount;i++){
//        Method method = methods[i];
//        SEL sel = method_getName(method);
//        NSLog(@"wch------------sel--%@",NSStringFromSelector(sel));
//    }


//    [xm setValue:@"sdfsf" forKey:@"sss"];
//    [xm test];

//[xm valueForKey:@"xxxxx"];

//    NSLog(@"wch-----------------xm._chengyuanM--%@",[xm valueForKey:@"_chengyuanM"]);
//    NSLog(@"wch-----------------xm.chengyuanM--%@",[xm valueForKey:@"chengyuanM"]);
    
    
    //4. 可以动态添加属性，但是不可以添加成员变量
//    objc_property_attribute_t types = { "T", "@\"NSString\"" };
//    objc_property_attribute_t ownership = { "C", "" }; // C = copy
//    objc_property_attribute_t backIvar = { "V", "_privateName" };
//    objc_property_attribute_t attrs[] = { types, ownership, backIvar };
//    //BOOL a = class_addProperty([xm class], "stuName", attrs, 3);
//    BOOL a = class_addIvar([xm class], "stuName", sizeof(NSString *), 0, "@");
//
//    NSLog(@"wch-----------------xm.stuName--result--%@",a?@"true":@"false");
//    NSLog(@"wch-----------------xm.stuName--%@",[xm valueForKey:@"stuName"]);

//    NSString *a = @"abcdefg";
//    NSLog(@"wch----------------length:%@",[a substringToIndex:2]);
//    xm.proSex = @"11111111";
//    [_xm addObserver:self forKeyPath:@"proSex" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
//    _xm.proSex = @"11111111";
//    [_xm setValue:@"sssss" forKey:@"proSex"];
//
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////        xm.proSex = @"222222222";
////        [xm didChangeValueForKey:@"proSex"];
//        [xm test];
//    });


    //6. isa
//    if([xm isMemberOfClass:[Xiaoming class]]){
//        NSLog(@"wch---------------001--true");
//    }
//    if([xm isMemberOfClass:[Person class]]){
//        NSLog(@"wch---------------002--true");
//    }
//    if([xm isMemberOfClass:[NSObject class]]){
//        NSLog(@"wch---------------003--true");
//    }
    
//    BOOL rez1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
//    BOOL rez2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
//    BOOL rez3 = [(id)[Xiaoming class] isKindOfClass:[Xiaoming class]];
//    BOOL rez4 = [(id)[Xiaoming class] isMemberOfClass:[Xiaoming class]];
//
//    NSLog(@"wch---------------001--%@",rez1?@"true":@"false");
//    NSLog(@"wch---------------002--%@",rez2?@"true":@"false");
//    NSLog(@"wch---------------003--%@",rez3?@"true":@"false");
//    NSLog(@"wch---------------004--%@",rez4?@"true":@"false");
}

//这个方法实际上没有被调用,但是必须实现否则不会调用下面的函数
- (void)say:(NSString *)aString
{
}

//self和_cmd是必须的，在之后可以随意添加其他参数
void say(id self,SEL _cmd,NSString *aString)
{
    NSLog(@"你好%@",aString);
}


//回调方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"proSex"]) {
        NSLog(@"wch-----------------change = %@",change);
        NSLog(@"wch-----------------new:%@",[NSString stringWithFormat:@"值： %@",[change valueForKey:@"new"]]);
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)dealloc{
    NSLog(@"wch------------------dealloc");
}

@end
