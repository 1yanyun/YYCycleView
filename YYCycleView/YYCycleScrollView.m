//
//  YYCycleScrollView.m
//  YYCycleView
//
//  Created by yan on 2017/12/8.
//  Copyright © 2017年 yan. All rights reserved.
//

#import "YYCycleScrollView.h"

@implementation YYCycleScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.clipsToBounds = NO;
        self.pagingEnabled = YES;
        [self reloadData];
    }
    return self;
}

- (void)reloadData{
    if (!self.delegate ||![self.delegate respondsToSelector:@selector(cellInScrollView:atIndex:)] ||![self.delegate respondsToSelector:@selector(numOfcellForScrollView:)]) {
        return;
    }
    
    NSInteger num = [self.delegate numOfcellForScrollView:self];
    CGSize size = [self.delegate sizeOfCellForScrollView:self];
    
    for (int i = 0; i<num; i++) {
        UIView *cell = [self.delegate cellInScrollView:self atIndex:i];
        cell.frame =CGRectMake((_padding + size.width) * i + _padding / 2, 0, size.width, size.height);
        [self addSubview:cell];
    }
    float contentWidth = (_padding + size.width) * num;
    [self setContentSize:CGSizeMake(contentWidth, 1)];
}

- (CGFloat)padding{
    if (!_padding) {
        _padding = 10;
    }
    return _padding;
}

- (CGFloat)leftRightOfset{
    if (!_leftRightOfset) {
        _leftRightOfset = 20;
    }
    return _leftRightOfset;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
