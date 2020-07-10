//
//  THDataM.m
//  GYSA
//
//  Created by SunQ on 2019/9/2.
//  Copyright © 2019年 itonghui. All rights reserved.
//

#import "THDataM.h"

@interface THDataM()
@property (nonatomic,   copy, readwrite) NSString          *title;
@property (nonatomic,   copy, readwrite) NSString          *detail;
@property (nonatomic,   copy, readwrite) NSString          *imgUrl;
@property (nonatomic,   copy, readwrite) NSMutableArray    *imgUrls;
@property (nonatomic,   copy, readwrite) NSString          *htmlStr;
//0文字，1图片，2富文本（html文本），3图片数组
@property (nonatomic, assign, readwrite) NSInteger         cellType;
@end

@implementation THDataM
+ (THDataM *)title:(NSString *)title detail:(NSString *)detail{
    THDataM *model = [[THDataM alloc]init];
    model.title = title;
    model.detail = detail;
    model.cellType = 0;
    return model;
}
+ (THDataM *)title:(NSString *)title imgUrl:(NSString *)imgUrl{
    THDataM *model = [[THDataM alloc]init];
    model.title = title;
    model.imgUrl = imgUrl;
    model.cellType = 1;
    return model;
}
+ (THDataM *)title:(NSString *)title htmlStr:(NSString *)htmlStr{
    THDataM *model = [[THDataM alloc]init];
    model.title = title;
    model.htmlStr = htmlStr;
    model.cellType = 2;
    return model;
}

+ (THDataM *)title:(NSString *)title imgUrls:(NSArray <NSString *>*)imgUrls{
    THDataM *model = [[THDataM alloc]init];
    model.title = title;
    model.imgUrls = [NSMutableArray arrayWithArray:imgUrls];
    model.cellType = 3;
    return model;
}

- (instancetype)init{
    self = [super init];
    if(self){//设置默认值
        self.accessoryType = UITableViewCellAccessoryNone;
        self.textAlignment = NSTextAlignmentLeft;
        self.detailColor = [UIColor darkGrayColor];
    }
    return self;
}
@end
