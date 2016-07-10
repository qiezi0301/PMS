//
//  RegisterViewController.m
//  PMS
//
//  Created by Mac on 16/7/10.
//  Copyright © 2016年 itjz. All rights reserved.
//

#import "RegisterViewController.h"
#import <BmobSDK/Bmob.h>


@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPswTextField;
@property (weak, nonatomic) IBOutlet UITextField *workTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end


@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置按钮圆角
    self.registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self setDefaultLeftBarButtonItem];
}

- (IBAction)registerToApp:(id)sender {
    
    if (self.usernameTextField.text.length == 0) {
        [self showInfomation:@"请输入用户名"];
        return;
    }
    if (self.passwordTextField.text.length == 0 || self.confirmPswTextField.text.length == 0) {
        [self showInfomation:@"请输入密码"];
        return;
    }
    if (![self.passwordTextField.text isEqualToString:self.confirmPswTextField.text]) {
        [self showInfomation:@"两次密码不一致，请重新输入"];
        return;
    }
    
    BmobUser *user = [[BmobUser alloc] init];
    [user setUsername:self.usernameTextField.text];
    [user setPassword:self.passwordTextField.text];
    [user setMobilePhoneNumber:self.phoneTextField.text];
    [user setObject:self.workTextField.text forKey:@"PMSWork"];

    
    [user signUpInBackgroundWithBlock:^ (BOOL isSuccessful, NSError *error){
        if (isSuccessful){
            NSLog(@"注册成功");
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Login" object:user.objectId];
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            [self showInfomation:error.description];
            NSLog(@"%@",error);
        }
    }];
    
}


@end
