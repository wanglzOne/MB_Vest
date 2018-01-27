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


//1043
#define leanCloudAPPID  @"lO99joPYokvFU9jNc0CVWT7z-gzGzoHsz"
#define leanCloudAPPKEY @"zd7THdqtcxEqAMvjXo9HmA6N"

#define TableName   @"switch"                         //对应哪个表
#define ObjectIdKey @"5a581eb6ee920a00587a0b04"

@interface ZKLeanCloudManager : NSObject
+ (void)registerLeanCloudSqlite;
+ (void)compareSwitchStatus:(void(^)(NSInteger switch_, NSString * link, NSString *appid))completionHandler; //开关状态
@end


