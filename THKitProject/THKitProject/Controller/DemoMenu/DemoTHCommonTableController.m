//
//  DemoTHCommonTableController.m
//  THKitProject
//
//  Created by 孙强 on 2020/5/17.
//  Copyright © 2020 sunq. All rights reserved.
//

#import "DemoTHCommonTableController.h"

@interface DemoTHCommonTableController ()<THCommonTableDelegate>
@property (nonatomic, strong) THCommonTable *mainTable;//
@property (nonatomic, strong) THScreenView *screenView;
@end

@implementation DemoTHCommonTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];//initUI
    
    [self configLayout];//configLayout
    
    [self loadData];//loadData
}

- (void)initUI{
    self.mainTable = [[THCommonTable alloc]init];
    self.mainTable.delegate = self;
    [self.mainTable reloadData];
    [self.view addSubview:self.mainTable];
}

- (void)configLayout{
    [self.mainTable mas_makeConstraints:^(MASConstraintMaker *make) {
        [make edges];
    }];
}

- (void)loadData{
    
}

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

@end
