//
//  DemoTHMessageViewController.m
//  THKitProject
//
//  Created by 孙强 on 2020/5/20.
//  Copyright © 2020 sunq. All rights reserved.
//

#import "DemoTHMessageViewController.h"

@interface DemoTHMessageViewController ()
@property (nonatomic, strong) THMessageView *contractName;//
@property (nonatomic, strong) THMessageView *userPhone;//
@property (nonatomic, strong) THMessageView *longMessage;//
@property (nonatomic, strong) THMessageView *frameMessage;//
@end

@implementation DemoTHMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];//initUI
    
    [self configLayout];//configLayout
}

- (void)initUI{
    self.contractName = [THMessageView messageViewType:THTextMessageTypePlain];
    self.contractName.backgroundColor = [UIColor whiteColor];
    self.contractName.title = @"内容展示";
    self.contractName.text = @"使用该控件建议使用autolayout布局，内容是自撑开的，支持在cell中使用，结合estimatedRowHeight可以实现自适应cell高度";
    [self.view addSubview:self.contractName];
    
    self.userPhone = [THMessageView messageViewType:THTextMessageTypePlain];
    self.userPhone.backgroundColor = [UIColor whiteColor];
    self.userPhone.title = @"空内容";
    self.userPhone.text = @"";
    [self.view addSubview:self.userPhone];
    
    self.longMessage = [THMessageView messageViewType:THTextMessageTypeHtmlText];
    self.longMessage.backgroundColor = [UIColor whiteColor];
    self.longMessage.numberOfLines = 0;
    self.longMessage.title = @"html";
    self.longMessage.text = @"<p style='color:#ff0000;text-align:left;'>欢迎使用THKit !为了保障用户的权益，请在注册THKit前，详细阅读本协议。一旦您注册为会员即表示您已接受了以下所述的条款和条件。</p><p  style='color:#00ff00;text-align:left;'>当您勾选“THKit协议条款”，并点击“同意协议并注册”时，即表示您已同意接受THKit的相关服务协议约束，包括但不限于本协议、THKit现有的、及时更新的或新发布的会员协议条款和隐私权政策以及其他各项规则、制度等等。</p>";
    [self.view addSubview:self.longMessage];
    
    CGRect rect = self.view.frame;
    self.frameMessage = [THMessageView messageViewType:THTextMessageTypePlain];
    self.frameMessage.backgroundColor = [UIColor whiteColor];
    self.frameMessage.frame = CGRectMake(0, 400, rect.size.width, 140);
    self.frameMessage.numberOfLines = 0;
    self.frameMessage.title = @"frame";
    self.frameMessage.text = @"frame布局演示，建议使用autolayout布局，使用frame布局的话要注意计算detail信息的内容高度，整个view的高度应当设置为detail文字高度+26.0，如果设置大了，标题和内容的顶部会出现不对齐的情况，如果设置小了会出现文字截断的情况";
    [self.view addSubview:self.frameMessage];
}

- (void)configLayout{
    float topH = [[UIApplication sharedApplication] statusBarFrame].size.height;
    [self.contractName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(topH+44.0);
    }];
    [self.userPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.contractName.mas_bottom);
    }];
    [self.longMessage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.userPhone.mas_bottom);
    }];
}
@end
