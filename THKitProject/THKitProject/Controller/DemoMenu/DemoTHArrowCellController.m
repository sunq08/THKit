//
//  DemoTHArrowCellController.m
//  THKitProject
//
//  Created by 孙强 on 2020/5/20.
//  Copyright © 2020 sunq. All rights reserved.
//

#import "DemoTHArrowCellController.h"

@interface DemoTHArrowCellController ()
@property (nonatomic, strong) THArrowCell *titleArrow;//
@property (nonatomic, strong) THArrowCell *iconArrow;//
@property (nonatomic, strong) THArrowCell *detailArrow;//
@property (nonatomic, strong) THArrowCell *richArrow;//
@end

@implementation DemoTHArrowCellController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];//initUI
    
    [self configLayout];//configLayout
}

- (void)initUI{
    self.titleArrow = [[THArrowCell alloc]init];
    self.titleArrow.title = @"标题";
    [self.view addSubview:self.titleArrow];
    
    self.iconArrow = [[THArrowCell alloc]init];
    self.iconArrow.title = @"图标";
    self.iconArrow.mainImg = [UIImage imageNamed:@"tabbar-homeH"];
    [self.view addSubview:self.iconArrow];
    
    self.detailArrow = [[THArrowCell alloc]init];
    self.detailArrow.title = @"图标";
    self.detailArrow.detailTitle = @"查看更多";
    [self.view addSubview:self.detailArrow];
    
    self.richArrow = [[THArrowCell alloc]init];
    self.richArrow.title = @"图标";
    self.richArrow.detailTitle = @"查看更多";
    self.richArrow.mainImg = [UIImage imageNamed:@"tabbar-homeH"];
    [self.view addSubview:self.richArrow];
}

- (void)configLayout{
    float topH = [[UIApplication sharedApplication] statusBarFrame].size.height;
    [self.titleArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(topH+44.0);
        make.height.mas_equalTo(44.0);
    }];
    [self.iconArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.titleArrow.mas_bottom);
        make.height.mas_equalTo(44.0);
    }];
    [self.detailArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.iconArrow.mas_bottom);
        make.height.mas_equalTo(44.0);
    }];
    [self.richArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.detailArrow.mas_bottom);
        make.height.mas_equalTo(44.0);
    }];
}
@end
