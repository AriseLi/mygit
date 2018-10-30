//
//  PTShanKaCheckVC.m
//  PotentialTraining
//
//  Created by 王猛 on 2018/1/28.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "PTShanKaCheckVC.h"
#import "ReadLeftCell.h"
#import "ShanKaCell.h"
@interface PTShanKaCheckVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *leftTab;
/** 记录选中的cell */
@property (nonatomic, strong)ReadLeftCell *selectCell;
@property (nonatomic, strong)UITableView *rightTab;
@end

@implementation PTShanKaCheckVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
    [self addSubViews];
}

- (void) setUpNav
{
    
    self.title = @"闪卡测试";
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
    
    self.rightTab = [[UITableView alloc]initWithFrame:CGRectMake(200, 0, kWMScreenWidth-200, kWMScreenHeight-64)];
    self.rightTab.backgroundColor = [UIColor whiteColor];
    self.rightTab.delegate = self;
    self.rightTab.dataSource = self;
    self.rightTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.rightTab.tableFooterView = [UIView new];
    [self.rightTab registerNib:[UINib nibWithNibName:NSStringFromClass([ShanKaCell class]) bundle:nil] forCellReuseIdentifier:@"ShanKaCell"];
    [self.view addSubview:self.rightTab];
    
}

#pragma mark - UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.leftTab) {
        return 10;
    }else{
        return 5;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTab) {
        ReadLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReadLeftCell"];
        if (indexPath.row == 0) {
            self.selectCell = cell;
            cell.classLabel.textColor = kWMColor(253, 134, 9);
        }
        return cell;
    }else{
        ShanKaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShanKaCell"];
        cell.titleLabel.text = @"数字测试";
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTab) {
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
    }else{
        kWMLog(@"点击了分类");
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTab) {
       return 50;
    }else{
      return 100;
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
