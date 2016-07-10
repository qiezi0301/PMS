//
//  BmobIMDemoPCH.h
//  PMS
//
//  Created by Mac on 16/7/9.
//  Copyright © 2016年 itjz. All rights reserved.
//

#ifndef BmobIMDemoPCH_h
#define BmobIMDemoPCH_h


typedef NS_ENUM(int,SystemMessageContact){
    SystemMessageContactAdd = 0,
    SystemMessageContactAgree,
    SystemMessageContactRefuse
};
//项目名称projectName
#define KProjectName       @"projectName"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kProjectTable       @"PMSProject"
#define kTaskTable          @"PMSTask"
#define kNewMessagesNotifacation @"NewMessagesNotifacation"
#define kNewMessageFromer        @"NewMessageFromer"

#define kDefaultViewBackgroundColor [UIColor colorWithRed:241 green:242 blue:246 alpha:1]
#define kDefaultbarTintColor [UIColor colorWithRed:(76./255.0) green:(35./255.0) blue:(139./255.0) alpha:1.0]
#define kDefaultbtnColor [UIColor colorWithRed:(76./255.0) green:(35./255.0) blue:(139./255.0) alpha:1.0]
#define kDefaultTextColor [UIColor colorWithHue:266.0/360.0 saturation:0.22 brightness:0.78 alpha: 1.0]
#endif /* BmobIMDemoPCH_h */
