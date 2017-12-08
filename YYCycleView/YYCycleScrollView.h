//
//  YYCycleScrollView.h
//  YYCycleView
//
//  Created by yan on 2017/12/8.
//  Copyright © 2017年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYCycleScrollView;
@protocol YYCycleScrollViewDelegate<UIScrollViewDelegate>
@required
- (UIView *)cellInScrollView:(UIScrollView *)scrollView atIndex:(NSInteger)index;

- (NSInteger)numOfcellForScrollView:(UIScrollView *)scrollView;

- (CGSize)sizeOfCellForScrollView:(UIScrollView *)scrollView;
@end

@interface YYCycleScrollView : UIScrollView

@property (nonatomic, weak) id<YYCycleScrollViewDelegate> delegate;
@property (nonatomic, assign) CGFloat padding;
@property (nonatomic, assign) CGFloat leftRightOfset;
@property (nonatomic, strong) NSMutableArray *imgArray;
@property (nonatomic, assign) CGSize cellSize;





@end
