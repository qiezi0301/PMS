//
//  LoginViewController.m
//  PMS
//
//  Created by Mac on 16/7/10.
//  Copyright © 2016年 itjz. All rights reserved.
//

#import "LoginViewController.h"
#import <BmobSDK/Bmob.h>
#import "TTTAttributedLabel.h"

@interface LoginViewController ()<TTTAttributedLabelDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *LoginButton;

@property (weak, nonatomic) IBOutlet TTTAttributedLabel *registerLabel;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *string = @"还没有账号?立即注册";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    NSRange range = [string rangeOfString:@"立即注册"];
    
    [attributedString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:kDefaultbarTintColor} range:range];
    self.registerLabel.text = attributedString;
    self.registerLabel.linkAttributes = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:(NSString *)kCTUnderlineStyleAttributeName];
    [self.registerLabel addLinkToURL:[NSURL URLWithString:@"register"] withRange:range];
    
    self.registerLabel.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = YES;
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    self.navigationController.navigationBarHidden = NO;
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(id)sender {
    if (self.usernameTextField.text.length == 0) {
        [self showInfomation:@"请输入用户名"];
        return;
    }
    if (self.passwordTextField.text.length == 0) {
        [self showInfomation:@"请输入密码"];
        return;
    }
    
    [BmobUser loginInbackgroundWithAccount:self.usernameTextField.text andPassword:self.passwordTextField.text block:^(BmobUser *user, NSError *error) {
        if (user) {
            [self hideLoading];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Login" object:user.objectId];
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
            [self showInfomation:error.description];
        }
    }];
}

-(void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url{
    NSLog(@"url %@",url.absoluteString);
    [self performSegueWithIdentifier:@"toRegisterVC" sender:nil];
}

@end
