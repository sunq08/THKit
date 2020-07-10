//
//  THKitConfig.m
//  GYSA
//
//  Created by SunQ on 2019/9/4.
//  Copyright © 2019年 itonghui. All rights reserved.
//

#import "THKitConfig.h"
#import "Masonry.h"
@implementation THKitConfig
+ (void)layoutViewRadioWith:(UIView *)view radio:(int)radio{
    [view.layer setCornerRadius:radio];
    [view.layer setMasksToBounds:YES];
}
/**设置圆角边框*/
+ (void)layoutViewRadioWith:(UIView *)view radio:(int)radio color:(UIColor *)color{
    [view.layer setCornerRadius:radio];
    [view.layer setBorderWidth:1];;
    [view.layer setBorderColor:[color CGColor]];
    [view.layer setMasksToBounds:YES];
}
+ (void)layoutViewBottomLineWith:(UIView *)view margin:(CGFloat)margin{
    UILabel *line = [[UILabel alloc] init];
    line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(margin);
        make.bottom.right.equalTo(view);
        make.height.mas_equalTo(1.0);
    }];
    
//    NSLayoutConstraint *lineH = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:1.0];
//    [line addConstraint:lineH];
//    NSLayoutConstraint *lineB = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f];
//    [view addConstraint:lineB];
//    NSLayoutConstraint *lineR = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f];
//    [view addConstraint:lineR];
//    NSLayoutConstraint *lineL = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:margin];
//    [view addConstraint:lineL];
}
+ (void)layoutViewHeightWith:(UIView *)view height:(float)height{
    CGRect frame = view.frame;
    frame.size.height = height;
    view.frame = frame;
}
+ (void)layoutViewWidthWith:(UIView *)view left:(float)left{
    CGRect frame = view.frame;
    frame.origin.x = left;
    view.frame = frame;
}
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
+ (UIViewController *)getSuperViewController:(UIView *)view {
    
    id nextResponder = [view nextResponder];
    while (nextResponder != nil) {
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            UIViewController *vc = (UIViewController *)nextResponder;
            return vc;
        }
        nextResponder = [nextResponder nextResponder];
    }
    return nil;
}
/** 计算文字宽度 */
+ (CGFloat)widthWithString:(NSString *)string fs:(CGFloat)fs height:(CGFloat)height{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fs]};
    return  [string boundingRectWithSize:CGSizeMake(0, height) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.width;
}
@end
UIColor *thrgb(CGFloat red, CGFloat green, CGFloat blue)
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}
