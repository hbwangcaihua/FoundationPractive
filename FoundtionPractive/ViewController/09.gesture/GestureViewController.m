//
//  GestureViewController.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/10.
//  Copyright © 2020 wch. All rights reserved.
//

#import "GestureViewController.h"

@interface GestureViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property(nonatomic,strong) UITableView *tableView;

@end

@implementation GestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Gesture";
    
    [self testForButton];
    
//    [self testForTableView];
}

#pragma mark - UIButton和触摸事件

-(void)testForButton{
    UIButton *runloopBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 94, 200, 40)];
    runloopBtn.backgroundColor = [UIColor grayColor];
    [runloopBtn setTitle:@"测试" forState:UIControlStateNormal];
//    runloopBtn.userInteractionEnabled = NO;
    [runloopBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:runloopBtn];

//    UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(10, 94, 200, 40)];
//    control.backgroundColor = [UIColor grayColor];
////    control.userInteractionEnabled = YES;
//    [control addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:control];

//    UISwitch *mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 94, 200, 40)];
//    mySwitch.userInteractionEnabled = NO;
//[self.view addSubview:mySwitch];

    UIView *viewA = [[UIView alloc] initWithFrame:CGRectMake(10, 150, 50, 50)];
    viewA.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewA];
    
//    UIView *viewB = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    viewB.backgroundColor = [UIColor redColor];
//    [runloopBtn addSubview:viewB];
    
    
    UITapGestureRecognizer *tapGestur1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [runloopBtn addGestureRecognizer:tapGestur1];
    
    UITapGestureRecognizer *tapGestur2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction2:)];
    [self.view addGestureRecognizer:tapGestur2];
}

-(void)tapAction:(id)sender{
    NSLog(@"wch-----------------tapAction--手势");
}

-(void)tapAction2:(id)sender{
    NSLog(@"wch-----------------tapAction--手势--button");
}

-(void)buttonClick:(id)sender{
    NSLog(@"wch-----------------buttonClick");
}

#pragma mark - UITableView和触摸事件

-(void)testForTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 80, self.view.width, 500) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    UITapGestureRecognizer *tapGestur1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tapGestur1.delegate = self;
    [self.tableView addGestureRecognizer:tapGestur1];
}

//配置每个section(段）有多少row（行） cell
//默认只有一个section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}
//每行显示什么东西
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //给每个cell设置ID号（重复利用时使用）
    static NSString *cellID = @"cellID";
    
    //从tableView的一个队列里获取一个cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    //判断队列里面是否有这个cell 没有自己创建，有直接使用
    if (cell == nil) {
        //没有,创建一个
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    //使用cell
    cell.textLabel.text = @"哈哈哈！！！";
    return cell;
}

//某个cell被点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];

    NSLog(@"wch------------------didSelect");
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"wch----------------%ld",indexPath.row);
    
    return 50;
}

#pragma mark - 事件

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent: (nullable UIEvent *)event{
    NSLog(@"wch----------------touchesBegan");
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    NSLog(@"wch----------------touchesMoved");
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    NSLog(@"wch----------------touchesEnded");
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    NSLog(@"wch----------------touchesCancelled");
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return  YES;
}

@end
