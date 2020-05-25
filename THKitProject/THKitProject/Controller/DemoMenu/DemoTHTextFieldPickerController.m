//
//  DemoTHTextFieldPickerController.m
//  THKitProject
//
//  Created by 孙强 on 2020/5/20.
//  Copyright © 2020 sunq. All rights reserved.
//

#import "DemoTHTextFieldPickerController.h"

@interface DemoTHTextFieldPickerController ()
@property (nonatomic, strong) THTextFieldPicker *commonPicker;//
@property (nonatomic, strong) THTextFieldPicker *timePicker;//
@property (nonatomic, strong) THDateFieldPicker *datePicker;//
@end

@implementation DemoTHTextFieldPickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];//initUI
    
    [self configLayout];//configLayout
}

- (void)initUI{
    self.commonPicker = [THTextFieldPicker creatTextFiledWithStyle:THTextFiledCommonPicker];
    self.commonPicker.placeholder = @"基于textField的选择器";
    self.commonPicker.backgroundColor = [UIColor whiteColor];
    NSMutableArray *pickerData = [NSMutableArray arrayWithCapacity:0];
    [pickerData addObject:@{@"1":@"待支付"}];
    [pickerData addObject:@{@"2":@"待审核"}];
    self.commonPicker.pickerData = pickerData;
    self.commonPicker.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    self.commonPicker.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:self.commonPicker];
    
    self.timePicker = [THTextFieldPicker creatTextFiledWithStyle:THTextFiledTimePicker];
    self.timePicker.dateFormate = @"YYYY.MM.dd";
    self.timePicker.placeholder = @"基于textField的时间选择器";
    self.timePicker.backgroundColor = [UIColor whiteColor];
    self.timePicker.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    self.timePicker.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:self.timePicker];
    
    self.datePicker = [[THDateFieldPicker alloc]init];
    self.datePicker.pickerViewMode = THDateFiledSecondMode;
    self.datePicker.placeholder = @"功能更强大时间选择器";
    self.datePicker.backgroundColor = [UIColor whiteColor];
    self.datePicker.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    self.datePicker.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:self.datePicker];
}

- (void)configLayout{
    float topH = [[UIApplication sharedApplication] statusBarFrame].size.height;
    [self.commonPicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30.0);
        make.right.equalTo(self.view).offset(-30.0);
        make.top.equalTo(self.view).offset(topH + 44.0+10.0);
        make.height.mas_equalTo(36.0);
    }];
    [self.timePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30.0);
        make.right.equalTo(self.view).offset(-30.0);
        make.top.equalTo(self.commonPicker.mas_bottom).offset(10.0);
        make.height.mas_equalTo(36.0);
    }];
    [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30.0);
        make.right.equalTo(self.view).offset(-30.0);
        make.top.equalTo(self.timePicker.mas_bottom).offset(10.0);
        make.height.mas_equalTo(36.0);
    }];
}

@end
