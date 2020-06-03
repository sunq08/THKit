//
//  DemoTHScreenViewController.m
//  THKitProject
//
//  Created by 孙强 on 2020/5/20.
//  Copyright © 2020 sunq. All rights reserved.
//

#import "DemoTHScreenViewController.h"

@interface DemoTHScreenViewController ()<THScreenViewDelegate>
@property (nonatomic, strong) UIButton *screenButton;//
@property (nonatomic, strong) UISegmentedControl *segment;//
@property (nonatomic, strong) THScreenView *screenView;
@property (nonatomic, strong) THScreenView *screenViewSide;
@end

@implementation DemoTHScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];//initUI
    
    [self configLayout];//configLayout
}

- (void)initUI{
    self.screenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.screenButton.backgroundColor = [UIColor blueColor];
    [self.screenButton setTitle:@"筛选" forState:UIControlStateNormal];
    [self.screenButton addTarget:self action:@selector(screenClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.screenButton];
    
    self.segment = [[UISegmentedControl alloc]initWithItems:@[@"下拉",@"侧滑"]];
    self.segment.selectedSegmentIndex = 0;
    [self.view addSubview:self.segment];
}

- (void)configLayout{
    [self.screenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 36));
    }];
    [self.segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.screenButton.mas_top).offset(-30.0);
        make.size.mas_equalTo(CGSizeMake(200, 36));
    }];
}

- (void)screenClick{
    if(self.segment.selectedSegmentIndex == 0){
        if(!self.screenView){
            self.screenView = [[THScreenView alloc]initWithFrame:self.view.bounds style:THScreenViewStyleDrop];
            self.screenView.delegate = self;
            [self.screenView reloadData];
        }
        [self.screenView showInView:self.view];
    }else{
        if(!self.screenViewSide){
            self.screenViewSide = [[THScreenView alloc]initWithFrame:self.view.bounds style:THScreenViewStyleSide];
            self.screenViewSide.delegate = self;
            [self.screenViewSide reloadData];
        }
        [self.screenViewSide showInView:self.view];
    }
}

#pragma mark - screen view
/** 共有几个选项*/
- (NSInteger)numberOfCellWithScreenView:(THScreenView *)screenView{
    return 4;
}
/** 设置单个选项的类型，标题等信息*/
- (THScreenBaseM *)screenView:(THScreenView *)screenView cellModelForIndex:(NSInteger)index{
    if(index == 0){
        THScreenTextM *titleM = [THScreenTextM cellModelWithIdentifier:@"title" title:@"标题"];
        return titleM;
    }else if (index == 1){
        THScreenSelectM *typeM = [THScreenSelectM cellModelWithIdentifier:@"type" title:@"类型"];
        NSMutableArray *pickData = [NSMutableArray arrayWithCapacity:0];
        [pickData addObject:@{@"1":@"待回复"}];
        [pickData addObject:@{@"2":@"待确认"}];
        [pickData addObject:@{@"3":@"已完成"}];
        typeM.pickerData = pickData;
        return typeM;
    }else if (index == 2){
        THScreenDateM *timeM = [THScreenDateM cellModelWithIdentifier:@"startTime,endTime" title:@"时间"];
        timeM.openRange = YES;
        return timeM;
    }else if (index == 3){
        THScreenCardM *classM = [THScreenCardM cellModelWithIdentifier:@"class" title:@"分类"];
        classM.pickerData = @[@{@"1":@"水果"},@{@"2":@"蔬菜"},@{@"3":@"饮料"}];
        return classM;
    }
    return nil;
}
/** 点击重置、确定调用的方法，将数据带出*/
- (void)screenView:(THScreenView *)screenView searchEventWithDict:(NSDictionary *)dict{
    NSLog(@"%@",dict);
}

@end
