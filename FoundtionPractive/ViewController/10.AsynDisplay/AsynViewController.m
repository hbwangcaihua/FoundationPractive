//
//  AsynViewController.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/10.
//  Copyright © 2020 wch. All rights reserved.
//

#import "AsynViewController.h"
#import "AsyncLabel.h"

@interface AsynViewController ()

@end

@implementation AsynViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"asyn";
    
    AsyncLabel *label = [[AsyncLabel alloc] initWithFrame:CGRectMake(50, 200, [UIScreen mainScreen].bounds.size.width - 2 * 50, 100)];
    label.backgroundColor = [UIColor lightGrayColor];
    label.text = @"今天是个好日子啊，心想的事儿都能成，今天是个好日子啊，啊，安心，太平";
    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
    [label.layer setNeedsDisplay];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
