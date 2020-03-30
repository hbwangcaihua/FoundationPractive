//
//  PageItemView.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import "PageItemView.h"
#import "UIColor+YSTurnRGB.h"
#import "CustomScrollView.h"

@interface PageItemView()<UIGestureRecognizerDelegate,UIScrollViewDelegate>

@property(nonatomic,strong) CustomScrollView *scrollView;

@property(nonatomic,strong) UIView *pageHeader;
//@property(nonatomic,strong) UIView *contentView;

@property (nonatomic, assign)  CGFloat startMoveOffsetY;
@property (nonatomic, assign)  CGFloat startScrollViewOffsetY;

@property(nonatomic,strong) UIPanGestureRecognizer *gesture;

@end

@implementation PageItemView

-(void)setUpSubView{

    //header
    _pageHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 150, kScreenWidth, 100)];
    _pageHeader.backgroundColor = [UIColor redColor];
    [self addSubview:_pageHeader];

    //最外层ScrollView
    _scrollView = [[CustomScrollView alloc] initWithFrame:CGRectMake(0, _pageHeader.bottom, self.width, self.height-_pageHeader.bottom)];
    _scrollView.backgroundColor =  [UIColor greenColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(_scrollView.width, kScreenHeight+200);
    [self addSubview:_scrollView];
    
    //给ScrollView添加手势
    _gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)];
    _gesture.delegate = self;
    [_scrollView addGestureRecognizer:_gesture];
    
    if(_pageIndex==1){
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 100, 50)];
        l.text = @"1111111111";
        [_scrollView addSubview:l];
        
        UILabel *l11 = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 100, 50)];
        l11.text = @"1111111111";
        [_scrollView addSubview:l11];
        
        UILabel *l2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 280, 100, 50)];
        l2.text = @"1111111111";
        [_scrollView addSubview:l2];
        
        UIButton *a = [[UIButton alloc] initWithFrame:CGRectMake(50, 250, 50, 50)];
        a.backgroundColor = [UIColor grayColor];
        [a addTarget:self action:@selector(aaaaa) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:a];
    }
    
    if(_pageIndex==2){
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 100, 50)];
        l.text = @"222222222222";
        [_scrollView addSubview:l];
        
        UIButton *a = [[UIButton alloc] initWithFrame:CGRectMake(50, 250, 50, 50)];
        a.backgroundColor = [UIColor grayColor];
        [a addTarget:self action:@selector(aaaaa) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:a];
    }
}

-(void)aaaaa{
    [self.itemDelegate clickTheIndex:_pageIndex];
}

#pragma mark - 平移手势代理

//判断允许多个手势同时识别，多手势处理关键
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    NSLog(@"wch------------------check---%lf",_pageHeader.top);

    
//    //悬停在顶部
//    if(_pageHeader.top==0){
//        return YES;
//    }
    
     return YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"wch----------------------scrollViewDidScroll");
}

- (void)panGestureRecognized:(UIPanGestureRecognizer *)pan
{
    NSLog(@"wch----------------------panGestureRecognized--:%lf",_scrollView.contentOffset.y);

//    //悬停在顶部
//    if(_pageHeader.top==0 && _scrollView.contentOffset.y<=0){
//        return;
//    }
//    if(_scrollView.contentOffset.y>0){
//        return;
//    }
//
//    //只有ScrollView在最顶部时才可以移动
//    [_scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
//
//    NSLog(@"wch------------------panGestureRecognized---%ld",pan.state);
//
//    if ([pan velocityInView:_scrollView].y < 0) {
//        NSLog(@"wch---------------------向上");
//    } else {
//        NSLog(@"wch---------------------向下");
//    }

    //获取相对于最原始的手指的偏移量
    CGPoint transP = [pan translationInView:_scrollView];
        
    if(pan.state == UIGestureRecognizerStateBegan)
    {
        self.startMoveOffsetY = _pageHeader.top;
        self.startScrollViewOffsetY = _scrollView.contentOffset.y;
//        [_scrollView setScrollEnabled:NO];
    } else if(pan.state == UIGestureRecognizerStateChanged){
        if(_scrollView.contentOffset.y>0 && [pan velocityInView:_scrollView].y > 0){
            return;
        }
        NSLog(@"wch----------------------panGestureRecognized--2--:%lf",_scrollView.contentOffset.y);
    
        CGFloat resultPosition = self.startMoveOffsetY + transP.y;
        if(self.startMoveOffsetY==0){
            resultPosition = resultPosition - self.startScrollViewOffsetY;
        }
        if(resultPosition<=0){
            resultPosition = 0;
        }
        _pageHeader.top = resultPosition;
        _scrollView.top = _pageHeader.bottom;
        _scrollView.height = self.height - _scrollView.top;
        
        if(resultPosition<=0){
        } else {
            [_scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        }
        
    } else if(pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled){
//        [_scrollView setScrollEnabled:YES];
//        _scrollView.userInteractionEnabled = YES;
//        _scrollView.contentSize = CGSizeMake(_scrollView.width, kScreenHeight);
//_gesture.cancelsTouchesInView = YES;
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
//        CGFloat offsetX = self.scrollView.contentOffset.x;
//       //满足条件拦截手势
//        if (offsetX == self.scrollView.contentSize.width - screenSize.width || offsetX == 0.0) {
//                return YES;
//        }
//    }
NSLog(@"wch----------------------gestureRecognizer");
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
NSLog(@"wch----------------------gestureRecognizerShouldBegin");
    return YES;
}


@end
