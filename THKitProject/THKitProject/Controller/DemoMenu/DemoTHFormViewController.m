//
//  DemoTHFormViewController.m
//  THKitProject
//
//  Created by 孙强 on 2020/5/17.
//  Copyright © 2020 sunq. All rights reserved.
//

#import "DemoTHFormViewController.h"

@interface DemoTHFormViewController ()<THFormViewDelegate>
@property (nonatomic, strong) THFormView *formView;//
@property (nonatomic, strong) NSMutableArray *cells;//
@end

@implementation DemoTHFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];//initUI
    
    [self configLayout];//configLayout
    
    [self loadData];//loadData
}

- (void)initUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.formView = [[THFormView alloc]initWithFrame:self.view.bounds];
    self.formView.delegate = self;
    self.formView.mustSign = YES;
    [self.formView reloadData];
    [self.view addSubview:self.formView];
}

- (void)configLayout{
    [self.formView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make edges];
    }];
}

- (void)loadData{
    self.cells = [NSMutableArray arrayWithCapacity:0];
    
    THFormTextM *numberInputM = [THFormTextM cellModelWithIdentifier:@"numberInputM"];
    numberInputM.title = @"数字输入框";
    numberInputM.limitLength = @20;
    numberInputM.validType = THFormTextValidNumber;
    numberInputM.mustIn = YES;
    numberInputM.keyboardType = UIKeyboardTypeNumberPad;
    [self.cells addObject:numberInputM];
    
    THFormTextM *passwordInputM = [THFormTextM cellModelWithIdentifier:@"passwordInputM"];
    passwordInputM.title = @"密码输入框";
    passwordInputM.limitLength = @20;
    passwordInputM.validType = THFormTextValidNone;
    passwordInputM.mustIn = YES;
    passwordInputM.secureTextEntry = YES;
    [self.cells addObject:numberInputM];
    
    THFormSwitchM *switchM = [THFormSwitchM cellModelWithIdentifier:@"switchM"];
    switchM.title = @"开关";
    [self.cells addObject:switchM];
    
    [self.formView reloadData];
}

///<共有多少行
- (NSInteger)numberOfIndexInFormView:(THFormView *)formView{
    return self.cells.count;
}
///<配置cell信息
- (THFormBaseM *)formView:(THFormView *)formView cellModelForIndex:(NSInteger)index{
    THFormBaseM *model = [self.cells objectAtIndex:index];
    return model;
}
@end
