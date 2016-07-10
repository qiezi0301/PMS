//
//  UserCenterViewController.h
//  PMS
//
//  Created by Mac on 16/7/10.
//  Copyright © 2016年 itjz. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSUInteger,SettingType) {
    SettingTypeSpace    = 0,   //空白
    SettingTypeAvatar   = 1,
    SettingTypeNick     = 2,
    SettingTypeGender   = 3,
    SettingTypeFeedback = 4
};

@interface UserCenterViewController : BaseViewController

@end
