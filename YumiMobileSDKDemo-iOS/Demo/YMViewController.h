//
//  YMViewController.h
//  YumiMediationDebugCenter-iOS
//
//  Created by ShunZhi Tang on 2017/7/13.
//  Copyright © 2017年 Zplay. All rights reserved.
//

@import UIKit;
#import "YumiCommonHeaderFile.h"
#import <YumiMediationSDK/YumiMediationConstants.h>

static NSString *const placementID = @"atb3ke1i"; //native test placementId
static NSString *const channelID = @"";
static NSString *const versionID = @"";

@protocol YMViewControllerDelegate <NSObject>

- (void)modifyPlacementID:(NSString *)placementID
                channelID:(NSString *)channelID
                versionID:(NSString *)versionID
                   adType:(YumiAdType)adType
               bannerSize:(YumiMediationAdViewBannerSize)bannerSize;

@end

@interface YMViewController : UIViewController

@property (nonatomic, weak) id<YMViewControllerDelegate> delegate;
@property (nonatomic, assign, getter=isPresented) BOOL presented;
@property (nonatomic, assign) YumiAdType adType;
@property (nonatomic, assign) YumiMediationAdViewBannerSize bannerSize;

@end
