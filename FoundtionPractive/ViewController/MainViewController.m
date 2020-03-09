//
//  MainViewController.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/2/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "MainViewController.h"
#import "RunloopViewController.h"
#import "GCDViewController.h"
#import "RunTimeViewController.h"
#import "NSOperationViewController.h"
#import "CustomUIView.h"
#import "BlockViewController.h"
#import "Xiaoming.h"
#import "TimerViewController.h"
#import "CALayerViewController.h"
#import "DictionaryViewController.h"

@interface MainViewController ()

@property(nonatomic,strong) CustomUIView *customUIView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.title = @"Main";
    
    
    UIButton *runloopBtn = [self createButton:@"01.runloop" tag:1001];
    [self.view addSubview:runloopBtn];
    
    
    UIButton *gcdBtn = [self createButton:@"02.gcd" tag:1002];
    gcdBtn.top = runloopBtn.bottom + 10;
    [self.view addSubview:gcdBtn];
    
    
    UIButton *runtimeBtn = [self createButton:@"03.runtime" tag:1003];
    runtimeBtn.top = gcdBtn.bottom + 10;
    [self.view addSubview:runtimeBtn];
    
    UIButton *operationBtn = [self createButton:@"04.nsoperaion" tag:1004];
    operationBtn.top = runtimeBtn.bottom + 10;
    [self.view addSubview:operationBtn];
    
    UIButton *blockBtn = [self createButton:@"05.block" tag:1005];
    blockBtn.top = operationBtn.bottom + 10;
    [self.view addSubview:blockBtn];
    
    UIButton *timerBtn = [self createButton:@"06.timer" tag:1006];
    timerBtn.top = blockBtn.bottom + 10;
    [self.view addSubview:timerBtn];
    
    UIButton *calayerBtn = [self createButton:@"07.CALayer" tag:1007];
    calayerBtn.top = timerBtn.bottom + 10;
    [self.view addSubview:calayerBtn];
    
    UIButton *dictionaryBtn = [self createButton:@"08.Dictionary" tag:1008];
    dictionaryBtn.top = calayerBtn.bottom + 10;
    [self.view addSubview:dictionaryBtn];
    
    _customUIView = [[CustomUIView alloc] initWithFrame:CGRectMake(0, 300, 100, 100)];
    _customUIView.backgroundColor = [UIColor grayColor];
    _customUIView.aaa = @"sfasjfk122222";
//    [self.view addSubview:_customUIView];
}

-(UIButton *)createButton:(NSString *)title tag:(NSInteger)tag{
    UIButton *runloopBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 74, 200, 40)];
    runloopBtn.backgroundColor = [UIColor grayColor];
    [runloopBtn setTitle:title forState:UIControlStateNormal];
    runloopBtn.tag = tag;
    [runloopBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return runloopBtn;
}

-(void)buttonClick:(id)sender{
    UIButton *btn = (UIButton *)sender;
    
    
    
    if(btn.tag==1001){
//        [_customUIView setNeedsLayout];
[_customUIView lay];
    
        RunloopViewController *runloopVC = [[RunloopViewController alloc] init];
        [self.navigationController pushViewController:runloopVC animated:YES];
    } else if(btn.tag==1002){
        GCDViewController *vc = [[GCDViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if(btn.tag==1003){
        RunTimeViewController *vc = [[RunTimeViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if(btn.tag==1004){
        NSOperationViewController *vc = [[NSOperationViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if(btn.tag==1005){
        BlockViewController *vc = [[BlockViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if(btn.tag==1006){
        TimerViewController *vc = [[TimerViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if(btn.tag==1007){
        CALayerViewController *vc = [[CALayerViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if(btn.tag==1008){
        DictionaryViewController *vc = [[DictionaryViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}



@end
