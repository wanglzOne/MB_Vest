//
//  ZKLeanCloudManager.h
//  LeanCloud
//
//  Created by Tom on 2017/12/28.
//  Copyright © 2017年 Tom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import <AVOSCloudCrashReporting/AVOSCloudCrashReporting.h>


//875
#define leanCloudAPPID  @"x6SKAfygig62kcfsAQqAoeaC-gzGzoHsz"
#define leanCloudAPPKEY @"jKU8lBNR3k3xVvQaDfJQ0OiM"

#define TableName   @"switch"                         //对应哪个表
#define ObjectIdKey @"5a59c081ac502e006e23fe3a"

@interface ZKLeanCloudManager : NSObject
+ (void)registerLeanCloudSqlite;
+ (void)compareSwitchStatus:(void(^)(NSInteger switch_, NSString * link, NSString *appid))completionHandler; //开关状态
@end

