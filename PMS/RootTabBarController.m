//
//  RootTabBarController.m
//  
//
//  Created by Mac on 16/7/9.
//
//

#import "RootTabBarController.h"
#import <BmobSDK/Bmob.h>
#import "ViewController.h"
#import "BmobIMDemoPCH.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupViewControllers];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if ([BmobUser getCurrentUser]) {
//        [self toViewController];
    }else{
        [self toLoginVC];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupViewControllers{
    self.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *snc = [[UIStoryboard storyboardWithName:@"Settings" bundle:nil] instantiateInitialViewController];
    [snc.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bar"] forBarMetrics:UIBarMetricsDefault];
    
    UINavigationController *cnc = [[UIStoryboard storyboardWithName:@"Contacts" bundle:nil] instantiateInitialViewController];
    [cnc.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bar"] forBarMetrics:UIBarMetricsDefault];
    
    UINavigationController *rnc = [[UIStoryboard storyboardWithName:@"Recent" bundle:nil] instantiateInitialViewController];
    [rnc.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bar"] forBarMetrics:UIBarMetricsDefault];
    
    self.viewControllers = @[rnc,cnc,snc];
    
    for (int i = 0; i < self.tabBar.items.count; i ++) {
        UITabBarItem *item = self.tabBar.items[i];
        switch (i) {
            case 0:{
                item.image = [UIImage imageNamed:@"tab_icon1"];
                item.selectedImage = [UIImage imageNamed:@"tab_icon1_"];
                item.title = @"我的任务";
            }
                break;
            case 1:{
                item.image = [UIImage imageNamed:@"tab_icon2"];
                item.selectedImage = [UIImage imageNamed:@"tab_icon2_"];
                item.title = @"所有任务";
            }
                break;
            case 2:{
                item.image = [UIImage imageNamed:@"tab_icon3"];
                item.selectedImage = [UIImage imageNamed:@"tab_icon3_"];
                item.title = @"所有项目";
            }
                break;
            case 3:{
                item.image = [UIImage imageNamed:@"tab_icon3"];
                item.selectedImage = [UIImage imageNamed:@"tab_icon3_"];
                item.title = @"个人中心";
            }
                break;
            default:
                break;
        }
        
    }
    
    self.tabBar.barTintColor = kDefaultbarTintColor;
    
}

-(void)toLoginVC{
    
    UINavigationController *loginNC = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginNC"];
    //    UINavigationController *lnc = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [self presentViewController:loginNC animated:YES completion:nil];
    [loginNC.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bar"] forBarMetrics:UIBarMetricsDefault];
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]};
    loginNC.navigationBar.titleTextAttributes = dic;
    
}

@end
