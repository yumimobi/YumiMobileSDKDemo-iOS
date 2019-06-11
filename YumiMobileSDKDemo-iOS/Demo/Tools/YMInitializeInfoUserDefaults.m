//
//  YMInitializeInfoUserDefaults.m
//  YumiMediationDebugCenter-iOS
//
//  Created by ShunZhi Tang on 2017/7/27.
//  Copyright © 2017年 Zplay. All rights reserved.
//

#import "YMInitializeInfoUserDefaults.h"

static NSString *const key = @"YumiMediation_PlacementIDs_key";

@implementation YMInitializeInfoUserDefaults

+ (instancetype)sharedPlacementIDsUserDefaults {
    static YMInitializeInfoUserDefaults *sharedUserDefaults = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUserDefaults = [[self alloc] init];
    });
    return sharedUserDefaults;
}

- (void)persistMediationInitializeInfo:(YMInitializeModel *)placementIDInfoModel {

    NSMutableArray<YMInitializeModel *> *placementIDs = [[self fetchMediationPlacementIDs] mutableCopy];
    if (!placementIDs) {
        placementIDs = [NSMutableArray array];
    }

    for (int index = 0; index < placementIDs.count; index++) {
        YMInitializeModel *tempModel = placementIDs[index];

        if ([tempModel.placementID isEqualToString:placementIDInfoModel.placementID]) {
            [placementIDs removeObjectAtIndex:index];
        }
    }

    [placementIDs insertObject:placementIDInfoModel atIndex:0];

    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:placementIDs];

    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:data forKey:key];
    [standardUserDefaults synchronize];
}

- (NSArray<YMInitializeModel *> *)fetchMediationPlacementIDs {

    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [standardUserDefaults objectForKey:key];
    if (!data) {
        return nil;
    }
    NSArray *placementIDs = [NSKeyedUnarchiver unarchiveObjectWithData:data];

    return placementIDs;
}

@end
