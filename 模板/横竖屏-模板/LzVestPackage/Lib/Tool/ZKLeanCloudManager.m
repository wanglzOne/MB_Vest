//
//  ZKLeanCloudManager.m
//  LeanCloud
//
//  Created by Tom on 2017/12/28.
//  Copyright © 2017年 Tom. All rights reserved.
//

#import "ZKLeanCloudManager.h"

@implementation ZKLeanCloudManager
+ (void)registerLeanCloudSqlite{
    [AVOSCloudCrashReporting enable];
    [AVOSCloud setApplicationId:leanCloudAPPID clientKey:leanCloudAPPKEY];
    [AVOSCloud setAllLogsEnabled:YES]; //隐藏打印
}

+ (void)compareSwitchStatus:(void(^)(NSInteger switch_, NSString * link,NSString *appid))completionHandler {
    AVQuery * query = [AVQuery queryWithClassName:TableName];
    [query getObjectInBackgroundWithId:ObjectIdKey block:^(AVObject *object, NSError *error) {
        NSString * switch_ = [object objectForKey:@"Switch"];
        NSString * AppID = [object objectForKey:@"AppID"];
        NSString * url = [object objectForKey:@"url"];
        if (completionHandler) {
            completionHandler (switch_.integerValue, url, AppID);
        }
    }];
}

@end
