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

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kInviteMessageTable      @"InviteMessage"
#define kFriendTable             @"Friend"
#define kNewMessagesNotifacation @"NewMessagesNotifacation"
#define kNewMessageFromer        @"NewMessageFromer"

#define kDefaultViewBackgroundColor [UIColor colorWithRed:241 green:242 blue:246 alpha:1]
#define kDefaultbarTintColor [UIColor colorWithRed:76 green:35 blue:139 alpha:1]
#define kDefaultbtnColor [UIColor colorWithRed:76 green:35 blue:139 alpha:1]

#endif /* BmobIMDemoPCH_h */
