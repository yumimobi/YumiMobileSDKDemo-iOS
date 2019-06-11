//
//  YMInitializeInfoUserDefaults
//  YumiMediationDebugCenter-iOS
//
//  Created by ShunZhi Tang on 2017/7/27.
//  Copyright © 2017年 Zplay. All rights reserved.
//

#import "YMInitializeModel.h"
#import <Foundation/Foundation.h>

@interface YMInitializeInfoUserDefaults : NSObject

+ (instancetype)sharedPlacementIDsUserDefaults;

- (void)persistMediationInitializeInfo:(YMInitializeModel *)placementIDInfoModel;

- (NSArray<YMInitializeModel *> *)fetchMediationPlacementIDs;

@end
