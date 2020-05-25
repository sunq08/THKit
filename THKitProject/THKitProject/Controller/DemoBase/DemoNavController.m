//
//  DemoNavController.m
//  THKitProject
//
//  Created by 孙强 on 2020/5/20.
//  Copyright © 2020 sunq. All rights reserved.
//

#import "DemoNavController.h"

@interface DemoNavController ()

@end

@implementation DemoNavController

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
}

#define NavBgColor [UIColor colorWithRed:30./255. green:185./255. blue:238./255. alpha:1.0]
+ (void)initialize{
    //导航栏主题 title文字属性
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],
                                     NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [navBar setBarTintColor:NavBgColor];
    
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    barItem.tintColor = [UIColor whiteColor];
}

//能拦截所有push进来的子控制器
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"Push------%@",NSStringFromClass([viewController class]));
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        //去除系统返回按钮文字
        UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_back_w"] style:UIBarButtonItemStylePlain target:self action:@selector(_back)];
        [viewController.navigationItem setLeftBarButtonItem:barItem];
    }
    //调用父类的push方法
    [super pushViewController:viewController animated:YES];
}

//返回
- (void)_back {
    [self popViewControllerAnimated:YES];
}

@end
