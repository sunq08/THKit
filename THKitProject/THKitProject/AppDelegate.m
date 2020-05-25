//
//  AppDelegate.m
//  THKitProject
//
//  Created by 孙强 on 2020/5/17.
//  Copyright © 2020 sunq. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoTabController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[DemoTabController alloc] init];;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
