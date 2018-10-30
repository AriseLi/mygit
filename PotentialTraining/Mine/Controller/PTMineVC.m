//
//  PTMineVC.m
//  PotentialTraining
//
//  Created by 王猛 on 2018/1/27.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "PTMineVC.h"
#import "MainInfoCell.h"
#import "mainClassCell.h"
#import "RankingView.h"
#import "InfoView.h"
@interface PTMineVC ()<UITableViewDelegate,UITableViewDataSource,TableviewDidSelect>
{
    //记录右侧选中的
    NSInteger secetRow;
}
@property (nonatomic, strong)UITableView *mainTab;
@property (nonatomic, strong) NSMutableArray *classAry;
/** 个人资料的View */
@property (nonatomic, strong) InfoView *infoView;
/** 排行榜的View */
@property (nonatomic, strong) RankingView *leftView;
@end

@implementation PTMineVC

- (NSMutableArray *)classAry{
    if (_classAry == nil) {
        _classAry = [NSMutableArray arrayWithObjects:@"排行榜",@"成绩查询",@"我的积分",@"我的推广码", nil];
    }
    return _classAry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    secetRow = 0;
    [self addSubViews];
}

#pragma mark - 右侧视图
- (void) addSubViews{
    /*
     *
     *tabelview
     *
     */
    self.mainTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 300, kWMScreenHeight-49-64)];
    self.mainTab.backgroundColor = kWMColor(238, 238, 238);
    self.mainTab.delegate = self;
    self.mainTab.dataSource = self;
    self.mainTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mainTab.tableFooterView = [UIView new];
    [self.mainTab registerNib:[UINib nibWithNibName:NSStringFromClass([MainInfoCell class]) bundle:nil] forCellReuseIdentifier:@"MainInfoCell"];
    [self.mainTab registerNib:[UINib nibWithNibName:NSStringFromClass([mainClassCell class]) bundle:nil] forCellReuseIdentifier:@"mainClassCell"];
    [self.view addSubview:self.mainTab];
    self.infoView = [[InfoView alloc]initWithFrame:CGRectMake(300, 0, kWMScreenWidth - 300, kWMScreenHeight-49-64)];
    [self.view addSubview:self.infoView];
    self.infoView.hidden = NO;
    self.leftView = [[RankingView alloc]initWithFrame:CGRectMake(300, 0, kWMScreenWidth - 300, kWMScreenHeight-49-64)];
    self.leftView.TabDetegate = self;
    [self.view addSubview:self.leftView];
    self.leftView.hidden = YES;
    
}

#pragma mark - 第二列表的点击事件
- (void)DidselectTTab:(NSIndexPath *)indexPath{
    kWMLog(@"%ld----%ld",indexPath.section,indexPath.row);
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MainInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainInfoCell"];
        cell.backgroundColor = kWMColor(238, 238, 238);
        if (secetRow == 0) {
            cell.backgroundColor = kWMColor(254, 211, 54);
        }
        return cell;
    }else{
        mainClassCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainClassCell"];
        cell.titleLabel.text = [NSString stringWithFormat:@"%@",self.classAry[indexPath.row-1]];
        
        if (indexPath.row == 3) {
            cell.subLabel.hidden = NO;
        }else{
            cell.subLabel.hidden = YES;
        }
        if (secetRow == indexPath.row) {
           cell.backgroundColor = kWMColor(254, 211, 54);
        }else{
            cell.backgroundColor = kWMColor(238, 238, 238);
        }
        return cell;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消点击后变色
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    secetRow = indexPath.row;
    [self.mainTab reloadData];
    if (indexPath.row == 0) {
        self.infoView.hidden = NO;
        self.leftView.hidden = YES;
    }else if (indexPath.row == 1 || indexPath.row == 2){
        self.leftView.hidden = NO;
        self.infoView.hidden = YES;
    }else{
        self.leftView.hidden = YES;
        self.infoView.hidden = YES;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 160;
    }else{
        return 60;
    }
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
