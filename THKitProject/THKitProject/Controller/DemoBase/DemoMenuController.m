//
//  DemoMenuController.m
//  THKitProject
//
//  Created by 孙强 on 2020/5/21.
//  Copyright © 2020 sunq. All rights reserved.
//

#import "DemoMenuController.h"
#import "DemoBaseController.h"
@interface DemoMenuCell:UICollectionViewCell
@property (nonatomic, strong) UILabel *textLabel;//
@property (nonatomic, strong) UILabel *detailTextLabel;//
@end
@implementation DemoMenuCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        float width = frame.size.width;
        float height = frame.size.height/2;
        
        CGRect rect = frame;
        rect.origin.x = 0;
        rect.origin.y = 0;
        self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.textLabel.font = [UIFont systemFontOfSize:13];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.textLabel];
        
        self.detailTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, height, width, height)];
        self.detailTextLabel.textColor = [UIColor lightGrayColor];
        self.detailTextLabel.font = [UIFont systemFontOfSize:13];
        self.detailTextLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.detailTextLabel];
    }
    return self;
}

@end

@interface DemoMenuController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong,nonatomic) UICollectionView *collectionView;
@end

@implementation DemoMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];//initUI
}

- (void)initUI{
    self.view.backgroundColor = [UIColor whiteColor];
    
    float screenW = [UIScreen mainScreen].bounds.size.width;
//    float screenH = [UIScreen mainScreen].bounds.size.height;
    
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(screenW/3, 80);//设置每个cell表格的大小
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//设置每个区的边界边距
    layout.minimumInteritemSpacing = 0;//设置最小的列间距，可以大于这个间距，但不可以小于
    layout.minimumLineSpacing = 0;//设置最小的行间距，可以大于这个间距，但不可以小于
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;//滚动方向
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsVerticalScrollIndicator = NO;
    [self.collectionView registerClass:[DemoMenuCell class] forCellWithReuseIdentifier:@"DemoMenuCell"];
    
    [self.view addSubview:self.collectionView];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.menus.count;
}
//在某个表格上返回一个cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DemoMenuCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"DemoMenuCell" forIndexPath:indexPath];
    NSDictionary *menu = [self.menus objectAtIndex:indexPath.row];
    cell.textLabel.text = [menu objectForKey:@"title"];
    cell.detailTextLabel.text = [menu objectForKey:@"remark"];
    cell.contentView.backgroundColor = [self UI_RandomColor];
    return cell;
}
//点击cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *menu = [self.menus objectAtIndex:indexPath.row];
    NSString *url = [menu objectForKey:@"url"];
    Class cls = NSClassFromString(url);
    DemoBaseController *nextVC = [[cls alloc] init];
    nextVC.vcData = menu;
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (UIColor *)UI_RandomColor{
    CGFloat r = arc4random_uniform(255);
    CGFloat g = arc4random_uniform(255);
    CGFloat b = arc4random_uniform(255);
    
    return [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:0.3f];
}

@end
