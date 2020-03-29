//
//  PageItemView.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "PageItemView.h"
#import "UIColor+YSTurnRGB.h"

@interface PageItemView()

@property(nonatomic,strong) UIScrollView *scrollView;

@property(nonatomic,strong) UIView *pageHeader;
@property(nonatomic,strong) UIView *contentView;

@end

@implementation PageItemView

-(void)setUpSubView{

    //最外层ScrollView
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.backgroundColor =  [UIColor turnStringToRGB:@"#000000" alpha:0.5f];
    //设置可滚动区域
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    
    //header
    _pageHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 150, kScreenWidth, 100)];
    _pageHeader.backgroundColor = [UIColor redColor];
    [_scrollView addSubview:_pageHeader];
    
    //内容View
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, _pageHeader.bottom, kScreenWidth, kScreenHeight)];
    _contentView.backgroundColor = [UIColor greenColor];
    [_scrollView addSubview:_contentView];
    
    _scrollView.contentSize = CGSizeMake(_contentView.width, _contentView.bottom);
    
    [self addSubview:_scrollView];
    
    if(_pageIndex==1){
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 100, 50)];
        l.text = @"1111111111";
        [_contentView addSubview:l];
        
        UIButton *a = [[UIButton alloc] initWithFrame:CGRectMake(50, 250, 50, 50)];
        a.backgroundColor = [UIColor grayColor];
        [a addTarget:self action:@selector(aaaaa) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:a];
    }
    
    if(_pageIndex==2){
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 100, 50)];
        l.text = @"222222222222";
        [_contentView addSubview:l];
        
        UIButton *a = [[UIButton alloc] initWithFrame:CGRectMake(50, 250, 50, 50)];
        a.backgroundColor = [UIColor grayColor];
        [a addTarget:self action:@selector(aaaaa) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:a];
    }
}

-(void)aaaaa{
    [self.itemDelegate clickTheIndex:_pageIndex];
}

@end
