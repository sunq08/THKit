//
//  DemoTHTextFiledViewController.m
//  THKitProject
//
//  Created by 孙强 on 2020/5/29.
//  Copyright © 2020 sunq. All rights reserved.
//

#import "DemoTHTextFiledViewController.h"

@interface DemoTHTextFiledViewController ()
@property (nonatomic, strong) THTextFieldView *userNameTF;//
@property (nonatomic, strong) THTextFieldView *passwordTF;//

@property (nonatomic, strong) THTextFieldView *contactNameTF;//
@property (nonatomic, strong) THTextFieldView *userPhoneTF;//
@end

@implementation DemoTHTextFiledViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];//initUI
    
    [self configLayout];//configLayout
}

- (void)initUI{
    self.userNameTF = [THTextFieldView textFieldViewType:THTextFieldViewTypePlain];
    self.userNameTF.iconSize = CGSizeMake(24, 24);
    self.userNameTF.iconImage = [UIImage imageNamed:@"login_user"];
    self.userNameTF.placeholder = @"请输入手机号";
    self.userNameTF.limitLength = @11;
    self.userNameTF.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.userNameTF];
    
    self.passwordTF = [THTextFieldView textFieldViewType:THTextFieldViewTypePlain];
    self.passwordTF.iconSize = CGSizeMake(24, 24);
    self.passwordTF.iconImage = [UIImage imageNamed:@"login_psd"];
    self.passwordTF.placeholder = @"请输入密码";
    self.passwordTF.limitLength = @20;
    self.passwordTF.secureTextEntry = YES;
    [self.view addSubview:self.passwordTF];
    
    self.contactNameTF = [THTextFieldView textFieldViewType:THTextFieldViewTypeTitle];
    self.contactNameTF.title = @"收货人";
    self.contactNameTF.placeholder = @"请输入收货人";
    self.contactNameTF.limitLength = @10;
    [self.view addSubview:self.contactNameTF];
    
    self.userPhoneTF = [THTextFieldView textFieldViewType:THTextFieldViewTypeTitle];
    self.userPhoneTF.title = @"手机号";
    self.userPhoneTF.placeholder = @"请输入手机号";
    self.userPhoneTF.limitLength = @11;
    self.userPhoneTF.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.userPhoneTF];
}

- (void)configLayout{
    float topH = [[UIApplication sharedApplication] statusBarFrame].size.height;
    [self.userNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(topH + 44.0);
        make.height.mas_equalTo(44.0);
    }];
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.userNameTF.mas_bottom);
        make.height.mas_equalTo(44.0);
    }];
    
    [self.contactNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30.0);
        make.right.equalTo(self.view).offset(-30.0);
        make.top.equalTo(self.passwordTF.mas_bottom).offset(30.0);
        make.height.mas_equalTo(44.0);
    }];
    [self.userPhoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30.0);
        make.right.equalTo(self.view).offset(-30.0);
        make.top.equalTo(self.contactNameTF.mas_bottom);
        make.height.mas_equalTo(44.0);
    }];
}
@end
