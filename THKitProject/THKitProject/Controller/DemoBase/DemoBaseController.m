//
//  DemoBaseController.m
//  THKitProject
//
//  Created by 孙强 on 2020/5/21.
//  Copyright © 2020 sunq. All rights reserved.
//

#import "DemoBaseController.h"
#import "SDPhotoBrowser.h"
@interface DemoBaseController ()<SDPhotoBrowserDelegate>
@property (nonatomic, strong) SDPhotoBrowser *photoBrowser;//
@end

@implementation DemoBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [self.vcData objectForKey:@"title"];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(readmeClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)readmeClick{
    NSString *readme = [self.vcData objectForKey:@"readme"];
    if(!readme || [readme isEqualToString:@""]){
        NSLog(@"没有添加代码图片!");
        return;
    }
    [self.photoBrowser show];
}

- (SDPhotoBrowser *)photoBrowser{
    if(!_photoBrowser){
        _photoBrowser = [SDPhotoBrowser new];
        _photoBrowser.delegate = self;
        _photoBrowser.currentImageIndex = 0;
        _photoBrowser.imageCount = 1;
        _photoBrowser.sourceImagesContainerView = self.view;
    }
    return _photoBrowser;
}

- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index{
    NSString *imageName = [NSString stringWithFormat:@"%@.png",[self.vcData objectForKey:@"readme"]];
    return [UIImage imageNamed:imageName];
}

@end
