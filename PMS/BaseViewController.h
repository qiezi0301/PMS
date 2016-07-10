//
//  BaseViewController.h
//  PMS
//
//  Created by Mac on 16/7/10.
//  Copyright © 2016年 itjz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "BmobIMDemoPCH.h"
#import <BmobSDK/Bmob.h>

@interface BaseViewController : UIViewController



-(void)setDefaultLeftBarButtonItem;

-(void)goback;

-(void)showLoading;

-(void)hideLoading;

-(void)showInfomation:(NSString *)info;

-(void)showProgress:(CGFloat)progress;

@end
