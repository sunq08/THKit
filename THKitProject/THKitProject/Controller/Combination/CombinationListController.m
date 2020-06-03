//
//  CombinationListController.m
//  THKitProject
//
//  Created by 孙强 on 2020/5/24.
//  Copyright © 2020 sunq. All rights reserved.
//

#import "CombinationListController.h"

@interface CombinationListController ()<THSortViewDelegate,THScreenViewDelegate,THCommonTableDelegate>
@property (nonatomic, strong) THSortView *sortView;//
@property (nonatomic, strong) THScreenView *screenView;
@property (nonatomic, strong) THCommonTable *mainTable;//

@end

@implementation CombinationListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];//initUI
    
    [self configLayout];//configLayout
}

- (void)initUI{
    self.sortView = [[THSortView alloc]init];
    self.sortView.backgroundColor = [UIColor whiteColor];
    self.sortView.showScreen = YES;
    self.sortView.delegate = self;
    [self.sortView reloadData];
    [self.view addSubview:self.sortView];
    
    self.mainTable = [[THCommonTable alloc]init];
    self.mainTable.delegate = self;
    [self.mainTable reloadData];
    [self.view addSubview:self.mainTable];
}

- (void)configLayout{
    float topH = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    [self.sortView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(topH+44.0);
        make.height.mas_equalTo(40.0);
    }];
    [self.mainTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.sortView.mas_bottom);
    }];
}

#pragma mark - sort view
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

- (void)sortViewDidSelectScreen:(THSortView *)sortView{
    if(!self.screenView){
        self.screenView = [[THScreenView alloc]initWithFrame:self.view.bounds style:THScreenViewStyleSide];
        self.screenView.delegate = self;
        [self.screenView reloadData];
    }
    [self.screenView showInView:self.view];
}

#pragma mark - table view
/*共有几个cell*/
- (NSInteger)numberOfRowInCommonTable:(THCommonTable *)commonTable{
    return 10;;
}
/*配置每个cell的内容*/
- (THDataConfigM *)commonTable:(THCommonTable *)commonTable configCellDataWithIndex:(NSInteger)index{
    THDataConfigM *configM = [[THDataConfigM alloc]init];
    configM.title = @"订单编号:20200101000000";
    configM.subTitle = @"待支付";
    configM.contents = @[@"买家：川建国",@"电话：10086",@"订单金额：￥299.00",@"下单时间：05.31"];
    if(index%3 == 0){
        configM.buttons = @[@"pay",@"cancel"];
    }else if (index%3 == 1){
        configM.buttons = @[@"receive"];
    }else{
        configM.buttons = @[@"pay"];
    }
    return configM;
}

/* 配置cell样式*/
- (void)commonTable:(THCommonTable *)table configCellStyleWithModel:(THCommonConfigM *)configM{
    configM.style = THCommonConfigCard;//THCommonConfigPlain
    configM.contentNumber = 4;//控制内容条数
    configM.openDouble = YES;//每行一条/两条
    NSMutableArray *buts = [NSMutableArray arrayWithCapacity:0];
    [buts addObject:@{@"title":@"订单支付",@"identifier":@"pay"}];
    [buts addObject:@{@"title":@"确认收货",@"identifier":@"receive"}];
    [buts addObject:@{@"title":@"取消订单",@"identifier":@"cancel"}];
    configM.buttonList = buts;
}
/* cell button的点击事件*/
- (void)commonTable:(THCommonTable *)table buttonClickWithIdentifier:(NSString *)identifier index:(NSInteger)index{
    NSLog(@"点击了第%ld行，按钮：%@",index,identifier);
}
/* cell select 事件*/
- (void)commonTable:(THCommonTable *)table didSelectCellAtIndex:(NSInteger)index{
    NSLog(@"选择了第%ld行",index);
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
