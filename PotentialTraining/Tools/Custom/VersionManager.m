//
//  VersionManager.m
//  naoPlus
//
//  Created by hxyt－iOS－王猛 on 15/11/7.
//  Copyright © 2015年 hxyt－iOS. All rights reserved.
//

#import "VersionManager.h"

static VersionManager *shareManager = nil;

@implementation VersionManager
+ (id) shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        shareManager = [[VersionManager alloc] init];
        
    });
    
    return shareManager;
}
@end
