//
//  PageItemView.h
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/29.
//  Copyright © 2020 wch. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenWidth                    [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight                   [[UIScreen mainScreen] bounds].size.height

NS_ASSUME_NONNULL_BEGIN

@protocol PageItemDelgt <NSObject>

@optional
- (void)clickTheIndex:(NSInteger)index;

@end

@interface PageItemView : UIView

@property (nonatomic ,weak)id<PageItemDelgt> itemDelegate;

@property(nonatomic,assign) NSInteger pageIndex;

-(void)setUpSubView;

@end

NS_ASSUME_NONNULL_END
