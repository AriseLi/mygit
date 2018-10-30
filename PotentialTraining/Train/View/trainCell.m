//
//  trainCell.m
//  PotentialTraining
//
//  Created by Arise on 2018/1/28.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "trainCell.h"

@implementation trainCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1;
}

@end
