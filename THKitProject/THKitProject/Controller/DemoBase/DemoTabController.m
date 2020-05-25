//
//  DemoTabController.m
//  THKitProject
//
//  Created by 孙强 on 2020/5/17.
//  Copyright © 2020 sunq. All rights reserved.
//

#import "DemoTabController.h"
#import "DemoMenuController.h"
#import "DemoNavController.h"
@interface DemoTabController ()

@end

@implementation DemoTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (void)loadData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DemoMenu" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (!jsonData || error) {
        //DLog(@"JSON解码失败");
    } else {
        [self drawTabBarViewWithArray:jsonObj];
    }
}

#define TabBgColor [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1]
#define TabTextNromalColor [UIColor colorWithRed:204/255. green:204/255. blue:204/255. alpha:1]
#define TabTextSelectColor  [UIColor colorWithRed:0/255. green:186/255. blue:242/255. alpha:1]
- (void)drawTabBarViewWithArray:(NSArray *)array{
    for (NSDictionary *dict in array) {
        DemoMenuController *vc = [[DemoMenuController alloc]init];
        vc.menus = [dict objectForKey:@"menus"];
        DemoNavController *nav = [[DemoNavController alloc] initWithRootViewController:vc];
        nav.tabBarItem.title = [dict objectForKey:@"title"];
        nav.tabBarItem.image = [UIImage imageNamed:[dict objectForKey:@"icon"]];
        nav.tabBarItem.selectedImage = [UIImage imageNamed:[dict objectForKey:@"iconH"]];
        [self addChildViewController:nav];
    }
    
    //解决iOS 12.1 Tabbar 跳动Bug
    NSString *version= [UIDevice currentDevice].systemVersion;
    if(version.doubleValue >=12.1) {
        [[UITabBar appearance] setTranslucent:NO];
    }
    //设置字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:TabTextNromalColor, NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: TabTextSelectColor, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
}

@end
