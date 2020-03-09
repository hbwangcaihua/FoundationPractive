//
//  CALayerViewController.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/5.
//  Copyright © 2020 wch. All rights reserved.
//

#import "CALayerViewController.h"

@interface CALayerViewController ()

@property(nonatomic,strong) UIView *calayerView;

@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CALayer";
    
    _calayerView = [[UIView alloc] initWithFrame:CGRectMake(20, 80, 200, 200)];
    _calayerView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_calayerView];
    
    CALayer * layer = [[CALayer alloc]init];
    layer.bounds=CGRectMake(0,0,100,100);
    layer.backgroundColor = [UIColor colorWithRed:0 green:146/255.0 blue:1.0/255.0 alpha:1.0].CGColor;
    [_calayerView.layer addSublayer:layer];

    layer.borderWidth=2;
    //设置颜色,QuartCore是跨平台的,所以无法使用UIColor
    layer.borderColor = [UIColor orangeColor].CGColor;
    layer.position=CGPointMake(_calayerView.width/2, _calayerView.height/2);
    layer.cornerRadius=100/2;
    layer.masksToBounds=YES;
    //设置阴影
    layer.shadowColor = [UIColor redColor].CGColor;
    layer.shadowOffset = CGSizeMake(10, 10);
    layer.shadowOpacity=0.9;
    
    
    
    //添加按钮
    UIButton *testBtn = [[UIButton alloc] initWithFrame:CGRectMake(_calayerView.bottom+20, 74, 200, 40)];
    testBtn.backgroundColor = [UIColor grayColor];
    [testBtn setTitle:@"点击" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];

}

-(void)buttonClick:(id)sender{

    //关闭隐式动画
    [CATransaction begin];
    //禁用隐式动画
    [CATransaction setDisableActions:YES];

    CALayer * layer = _calayerView.layer.sublayers[0];
    CGFloat width = layer.bounds.size.width;
    if(width == _calayerView.width/2) {
        width = 2*_calayerView.width;
    }
    else{
        width = _calayerView.width/2;
    }
    layer.bounds=CGRectMake(0,0, width, width);
//    //设置layer的当前位置是点击的点的位置(点击在self.view上的点)
//    layer.position = [touch locationInView:self.view];
//    layer.cornerRadius= width /2;

    //开启隐式动画
    [CATransaction commit];
}

@end
