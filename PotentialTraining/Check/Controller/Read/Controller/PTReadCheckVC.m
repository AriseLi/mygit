//
//  PTReadCheckVC.m
//  PotentialTraining
//
//  Created by 王猛 on 2018/1/28.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "PTReadCheckVC.h"
#import "ReadLeftCell.h"
#import "trainCell.h"
@interface PTReadCheckVC ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)UITableView *leftTab;
@property (nonatomic, strong) UICollectionView *classCollectionView;
/** 记录选中的cell */
@property (nonatomic, strong)ReadLeftCell *selectCell;
@end

@implementation PTReadCheckVC


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
    [self addSubViews];
}

- (void) setUpNav{
    self.title = @"阅读测试";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 右侧视图
- (void) addSubViews{
    /*
     *
     *tabelview
     *
     */
    self.leftTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, kWMScreenHeight-64)];
    self.leftTab.backgroundColor = kWMColor(238, 238, 238);
    self.leftTab.delegate = self;
    self.leftTab.dataSource = self;
    self.leftTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.leftTab.tableFooterView = [UIView new];
    [self.leftTab registerNib:[UINib nibWithNibName:NSStringFromClass([ReadLeftCell class]) bundle:nil] forCellReuseIdentifier:@"ReadLeftCell"];
    [self.view addSubview:self.leftTab];
    /**
     *
     *我要写一个NB的collectionView
     */
    // 这个是系统提供的布局类，可以布局一些比较规则的布局。
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置每个item的大小，
    flowLayout.itemSize = CGSizeMake((kWMScreenWidth-200- 120)/3, (kWMScreenWidth-200- 120)/3);//宽高
    // 设置列的最小间距，cell之间的距离
    flowLayout.minimumInteritemSpacing = 0;
    // 设置最小行间距
    flowLayout.minimumLineSpacing = 20;
    // 设置布局的内边距
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    // 滚动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;//纵向滑动
    self.classCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(200, 0, kWMScreenWidth-200, kWMScreenHeight-64) collectionViewLayout:flowLayout];
    flowLayout.headerReferenceSize = CGSizeMake(0, 0);
    [self.classCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionViewHeader"];
    self.classCollectionView.showsVerticalScrollIndicator = NO;
    self.classCollectionView.backgroundColor = [UIColor whiteColor];
    // 设置代理
    self.classCollectionView.delegate = self;
    self.classCollectionView.dataSource = self;
    [self.classCollectionView registerNib:[UINib nibWithNibName:@"trainCell" bundle:nil] forCellWithReuseIdentifier:@"trainCell"];
    [self.view addSubview:self.classCollectionView];
    
}

#pragma mark - UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReadLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReadLeftCell"];
    if (indexPath.row == 0) {
        self.selectCell = cell;
        cell.classLabel.textColor = kWMColor(253, 134, 9);
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消点击后变色
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ReadLeftCell *cell = [self.leftTab cellForRowAtIndexPath:indexPath];
    if (self.selectCell == cell) {
        cell.classLabel.textColor = kWMColor(253, 134, 9);
    }else{
        self.selectCell.classLabel.textColor = [UIColor blackColor];
        cell.classLabel.textColor = kWMColor(253, 134, 9);
        self.selectCell = cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

#pragma mark - UICollectionView Delegate
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0){
    return NO;
}

// 返回分区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

// 每个分区多少个item
- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 20;
    }else{
        return 15;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    trainCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"trainCell" forIndexPath:indexPath];
//    NSArray *ary = self.dataAry[indexPath.section];
//    cell.titleLabel.text = [NSString stringWithFormat:@"%@",ary[indexPath.item]];
    return cell;
    
}



- (void) dealloc
{
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
