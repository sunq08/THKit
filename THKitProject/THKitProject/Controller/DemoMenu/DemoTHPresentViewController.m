//
//  DemoTHPresentViewController.m
//  THKitProject
//
//  Created by 孙强 on 2020/5/25.
//  Copyright © 2020 sunq. All rights reserved.
//

#import "DemoTHPresentViewController.h"

@interface DemoTHPresentViewController ()<THDataPresentViewDelegate>
@property (nonatomic, strong) THDataPresentView *presentView;// 

@end

@implementation DemoTHPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];//initUI
    
    [self configLayout];//configLayout
}

- (void)initUI{
    self.presentView = [[THDataPresentView alloc]init];
    self.presentView.delegate = self;
    [self.view addSubview:self.presentView];
}

- (void)configLayout{
    [self.presentView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make edges];
    }];
}

/** 共有多少行*/
- (NSInteger)presentView:(THDataPresentView *)presentView numberOfRowInSection:(NSInteger)section{
    if(section == 0){
        return 5;
    }
    return 1;
}
/** 配置cell*/
- (THDataM *)presentView:(THDataPresentView *)presentView configCellWithIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        if(indexPath.row == 0){
            THDataM *imageM = [THDataM title:@"头像" imgUrl:@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2841648446,236398816&fm=26&gp=0.jpg"];
            imageM.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return imageM;
        }else if(indexPath.row == 1){
            THDataM *nickNameM = [THDataM title:@"昵称" detail:@"川爱国"];
            nickNameM.textAlignment = NSTextAlignmentRight;
            nickNameM.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return nickNameM;
        }else if(indexPath.row == 2){
            THDataM *numberM = [THDataM title:@"微信号" detail:@"love USA chuan"];
            numberM.textAlignment = NSTextAlignmentRight;
            
            return numberM;
        }else if(indexPath.row == 3){
            THDataM *codeM = [THDataM title:@"二维码名片" detail:@""];
            codeM.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return codeM;
        }else if(indexPath.row == 4){
            THDataM *moreM = [THDataM title:@"更多" detail:@""];
            moreM.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return moreM;
        }
    }else if(indexPath.section == 1){
        if(indexPath.row == 0){
            THDataM *addressM = [THDataM title:@"我的地址" detail:@""];
            addressM.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return addressM;
        }
    }else if (indexPath.section == 2){
        NSArray *urls = @[@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2841648446,236398816&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2841648446,236398816&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2841648446,236398816&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2841648446,236398816&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2841648446,236398816&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2841648446,236398816&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2841648446,236398816&fm=26&gp=0.jpg"];
        THDataM *nickNameM = [THDataM title:@"个人相册：" imgUrls:urls];
        nickNameM.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return nickNameM;
    }
    
    return nil;
}

/** 共有多少区*/
- (NSInteger)numberOfSectionInPresentView:(THDataPresentView *)presentView{
    return 3;
}
/** 点击事件*/
- (void)presentView:(THDataPresentView *)presentView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了%@",indexPath);
}


@end
