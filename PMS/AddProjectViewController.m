//
//  AddProjectViewController.m
//  PMS
//
//  Created by Mac on 16/7/10.
//  Copyright © 2016年 itjz. All rights reserved.
//

#import "AddProjectViewController.h"

@interface AddProjectViewController ()
@property (weak, nonatomic) IBOutlet UITextField *projectTextField;

@property (weak, nonatomic) IBOutlet UIButton *addProjectBtn;
@end

@implementation AddProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setDefaultLeftBarButtonItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addProjectAction:(id)sender {
    if (self.projectTextField.text.length == 0) {
        [self showInfomation:@"项目名称不能为空"];
        return;
    }
    
    //创建或插入一个项目
    BmobObject  *projectScore = [BmobObject objectWithClassName:kProjectTable];
    [projectScore setObject:self.projectTextField.text forKey:@"projectName"];
    
    //设置帖子关联的作者记录
    BmobUser *author = [BmobUser objectWithoutDataWithClassName:@"_User" objectId:[BmobUser getCurrentUser].objectId];
    [projectScore setObject:author forKey:@"author"];

    //异步保存到服务器
    [projectScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            //创建成功后会返回objectId，updatedAt，createdAt等信息
            //创建对象成功，打印对象值
            NSLog(@"%@",projectScore);
            
            [self goback];
        } else if (error){
            //发生错误后的动作
            NSLog(@"%@",error);
        } else {
            NSLog(@"Unknow error");
        }
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
