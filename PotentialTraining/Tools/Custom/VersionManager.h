//
//  VersionManager.h
//  naoPlus
//
//  Created by hxyt－iOS－王猛 on 15/11/7.
//  Copyright © 2015年 hxyt－iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VersionManager : NSObject

@property (nonatomic, copy)NSString *currentVersion;

@property (nonatomic, copy)NSString *activeUrl;

@property (nonatomic, copy)NSString *agreementUrl;


+ (id) shareManager;


@end



