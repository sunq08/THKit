//
//  THDataM.h
//  GYSA
//
//  Created by SunQ on 2019/9/2.
//  Copyright © 2019年 itonghui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface THDataM : NSObject

#pragma mark - 创建对象方法，必须用以下方法创建，才能识别数据类型
/* 文字类型*/
+ (THDataM *)title:(NSString *)title detail:(NSString *)detail;
/* 图片类型**/
+ (THDataM *)title:(NSString *)title imgUrl:(NSString *)imgUrl;
/* 富文本**/
+ (THDataM *)title:(NSString *)title htmlStr:(NSString *)htmlStr;
/* 图片数组**/
+ (THDataM *)title:(NSString *)title imgUrls:(NSArray <NSString *>*)imgUrls;

#pragma mark - 可选参数
/* 详细文字颜色*/
@property (nonatomic, strong) UIColor         *detailColor;
/* 详细文字对齐方式*/
@property (nonatomic, assign) NSTextAlignment textAlignment;//
/* cell右侧icon样式*/
@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;

#pragma mark - 只读参数
@property (nonatomic,   copy, readonly) NSString          *title;
@property (nonatomic,   copy, readonly) NSString          *detail;
@property (nonatomic,   copy, readonly) NSString          *imgUrl;
@property (nonatomic,   copy, readonly) NSMutableArray    *imgUrls;
@property (nonatomic,   copy, readonly) NSString          *htmlStr;
//0文字，1图片，2富文本（html文本），3图片数组
@property (nonatomic, assign, readonly) NSInteger         cellType;

@end

NS_ASSUME_NONNULL_END
