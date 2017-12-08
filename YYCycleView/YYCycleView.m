//
//  YYCycleView.m
//  YYCycleView
//
//  Created by yan on 2017/12/8.
//  Copyright © 2017年 yan. All rights reserved.
//

#import "YYCycleView.h"

@implementation YYCycleView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        YYCycleScrollView *scrollView = [[YYCycleScrollView alloc]init];
        scrollView.frame = CGRectMake((self.frame.size.width - scrollView.cellSize.width) / 2, 0, scrollView.cellSize.width + scrollView.padding, self.frame.size.height);
        self.cycleScrollView = scrollView;
        [self addSubview:scrollView];
    }
    return self;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
