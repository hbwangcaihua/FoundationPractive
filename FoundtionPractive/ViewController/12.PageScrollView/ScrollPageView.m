//
//  ScrollPageView.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "ScrollPageView.h"
#import "UIColor+YSTurnRGB.h"
#import "PageItemView.h"

@interface ScrollPageView()<PageItemDelgt>

@property (nonatomic , strong ) UIScrollView *scrollContentView;

@end

@implementation ScrollPageView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setUpSubViews];
    }
    return self;
}

-(void)setUpSubViews{
    self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
//    self.backgroundColor =  [UIColor turnStringToRGB:@"0x000000" alpha:0.5f];
    
    _scrollContentView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollContentView.backgroundColor =  [UIColor clearColor];
    _scrollContentView.scrollsToTop = NO;
    _scrollContentView.pagingEnabled = YES;
    _scrollContentView.showsHorizontalScrollIndicator = NO;
    _scrollContentView.showsVerticalScrollIndicator = NO;
    [self addSubview:_scrollContentView];
}

#pragma mark - 外部调用

-(void)showInParent:(UIView *)parentView{
//    self.backgroundColor = [UIColor colorWithHex:0x000000 alpha:0.0f];
//    [self.layerContentView setViewY:self.bottom];
    [parentView addSubview:self];
    
    PageItemView *itemView = [[PageItemView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    itemView.pageIndex = 1;
    itemView.itemDelegate = self;
    [_scrollContentView addSubview:itemView];
    [itemView setUpSubView];
    
//    _scrollContentView.height = kScreenHeight/2;
    _scrollContentView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
    
    
}


- (void)clickTheIndex:(NSInteger)index{
    NSLog(@"wch----------------clickTheIndex--%ld",index);
    
    if(index==1){
        PageItemView *itemView = [[PageItemView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        itemView.pageIndex = 2;
        itemView.itemDelegate = self;
        [_scrollContentView addSubview:itemView];
        [itemView setUpSubView];
        
        //设置可滚动区域
        _scrollContentView.contentSize = CGSizeMake(kScreenWidth*2, kScreenHeight);
        
        //滚动到第二页
        [_scrollContentView setContentOffset:CGPointMake(kScreenWidth, 0) animated:YES];
    } else {
        //滚动到第一页
        [_scrollContentView setContentOffset:CGPointMake(0, 0) animated:YES];
        
        //设置可滚动区域
//        _scrollContentView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
    }
}

// 返回YES表示可以继续传递触摸事件，这样两个嵌套的scrollView才能同时滚动
//- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    id view = otherGestureRecognizer.view;
//    
////    if (_allowGestureEventPassViews && [_allowGestureEventPassViews containsObject:view]) {
//        return YES;
////    } else {
////        return NO;
////    }
//}

@end
