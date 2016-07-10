//
//  UserCenterViewController.m
//  PMS
//
//  Created by Mac on 16/7/10.
//  Copyright © 2016年 itjz. All rights reserved.
//

#import "UserCenterViewController.h"
#import <BmobSDK/Bmob.h>

@interface UserCenterViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) BmobUser *user;

@end

@implementation UserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置按钮圆角
    self.logoutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.user = [BmobUser getCurrentUser];
    [self setupSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSUInteger type = [self.dataArray[indexPath.row] unsignedIntegerValue];
//    switch (type) {
//        case SettingTypeSpace:{
////            return [self spaceTableViewCell:tableView indexPath:indexPath];
//        }
//            break;
//        case SettingTypeAvatar:{
////            return [self avatarTableViewCell:tableView indexPath:indexPath];
//        }
//            break;
//        default:{
////            return [self titleTableViewCell:tableView indexPath:indexPath type:type];
//        }
//            break;
//    }
    return nil;
}


#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSUInteger type = [self.dataArray[indexPath.row] unsignedIntegerValue];
    switch (type) {
        case SettingTypeGender:{
            //            [self changeGender];
        }
            break;
        case SettingTypeAvatar:{
//            [self upload];
        }
            break;
        case SettingTypeNick:{
//            [self changeNick];
        }
            break;
        default:
            break;
    }
}

-(void)setupSubviews{
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView reloadData];
//    [self.logoutButton addTarget:self action:@selector(logoutAction) forControlEvents:UIControlEventTouchUpInside];
}
- (IBAction)logoutAction:(id)sender {
    if ([BmobUser getCurrentUser]) {
        [BmobUser logout];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Logout" object:nil];
        [self showInfomation:@"退出成功"];
        [self toLoginVC];
    }else{
        [self showInfomation:@"未登录"];
    }
}

/*
-(void)logoutAction{
    if ([BmobUser getCurrentUser]) {
        [BmobUser logout];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Logout" object:nil];
        [self showInfomation:@"退出成功"];
        [self toLoginVC];
    }else{
        [self showInfomation:@"未登录"];
    }
    
}
*/
-(void)toLoginVC{
    
    UINavigationController *loginNC = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginNC"];
    [self presentViewController:loginNC animated:YES completion:nil];
    [loginNC.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bar"] forBarMetrics:UIBarMetricsDefault];
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]};
    loginNC.navigationBar.titleTextAttributes = dic;
    
}

@end
