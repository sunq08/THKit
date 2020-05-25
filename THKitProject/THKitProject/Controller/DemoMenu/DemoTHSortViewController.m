//
//  DemoTHSortViewController.m
//  THKitProject
//
//  Created by 孙强 on 2020/5/17.
//  Copyright © 2020 sunq. All rights reserved.
//

#import "DemoTHSortViewController.h"

@interface DemoTHSortViewController ()<THSortViewDelegate>
@property (nonatomic, strong) THSortView *sortView;//
@end

@implementation DemoTHSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];//initUI
    
    [self configLayout];//configLayout
    
    [self loadData];//loadData
}

- (void)initUI{
    self.sortView = [[THSortView alloc]init];
    self.sortView.backgroundColor = [UIColor whiteColor];
    self.sortView.delegate = self;
    [self.sortView reloadData];
    [self.view addSubview:self.sortView];
}

- (void)configLayout{
    float topH = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    [self.sortView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(topH+44.0);
        make.height.mas_equalTo(40.0);
    }];
}

- (void)loadData{
    
}

/** 使用键（identifier）值（标题）对的方式进行初始化*/
- (NSMutableArray <NSDictionary *>*)titlesWithSortView:(THSortView *)sortView{
    NSMutableArray *titles = [NSMutableArray arrayWithCapacity:0];
    [titles addObject:@{@"common":@"综合排序"}];
    [titles addObject:@{@"price":@"价格排序"}];
    [titles addObject:@{@"time":@"时间排序"}];
    return titles;
}

- (void)sortView:(THSortView *)sortView didSelectItemWithId:(NSString *)identifier{
    NSLog(@"点击了%@",identifier);
}

@end
