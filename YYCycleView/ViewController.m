//
//  ViewController.m
//  YYCycleView
//
//  Created by yan on 2017/12/8.
//  Copyright © 2017年 yan. All rights reserved.
//

#import "ViewController.h"
#import "YYCycleView.h"

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height



@interface ViewController ()<YYCycleScrollViewDelegate>
@property (nonatomic, strong) YYCycleScrollView *cycleScrollView;
@property (nonatomic, strong) NSMutableArray *imgArr;
@property (nonatomic, assign) CGSize cellSize;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setScrollview];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setScrollview{
    CGFloat height = 200;
    YYCycleView *mainView = [[YYCycleView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, height)];
    [self.view addSubview:mainView];
    _cycleScrollView.padding = 10;
    _cycleScrollView.leftRightOfset = 20;
    _cellSize.height = height;
    _cellSize.width = SCREEN_WIDTH - 2 * (_cycleScrollView.padding + _cycleScrollView.leftRightOfset);
    _cycleScrollView.frame = CGRectMake((mainView.frame.size.width - _cellSize.width) / 2, 0, _cellSize.width + _cycleScrollView.padding, mainView.frame.size.height);
    _cycleScrollView = mainView.cycleScrollView;
    _cycleScrollView.delegate = self;
    _cycleScrollView.imgArray = [NSMutableArray arrayWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg", nil];
    _cycleScrollView.backgroundColor = [UIColor redColor];
    
}

- (UIView *)cellInScrollView:(UIScrollView *)scrollView atIndex:(NSInteger)index{
    UIView *view = [[UIView alloc]init];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _cellSize.width, _cellSize.height)];
    imageView.image = [UIImage imageNamed:_imgArr[index]];
    [view addSubview:imageView];
    return view;
}

- (CGSize)sizeOfCellForScrollView:(UIScrollView *)scrollView{
    _cellSize = CGSizeMake(100, 100);
    return _cellSize;
}

- (NSInteger)numOfcellForScrollView:(UIScrollView *)scrollView{
    return _imgArr.count;
}

- (NSMutableArray *)imgArr{
    if (!_imgArr) {
        _imgArr = [NSMutableArray arrayWithArray:_cycleScrollView.imgArray];
        [_imgArr insertObject:[_cycleScrollView.imgArray lastObject] atIndex:0];
        [_imgArr addObject:_cycleScrollView.imgArray[0]];
    }
    return _imgArr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
