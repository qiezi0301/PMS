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

    UINavigationController *mtnc = [[UIStoryboard storyboardWithName:@"MyTask" bundle:nil] instantiateInitialViewController];
    [mtnc.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bar"] forBarMetrics:UIBarMetricsDefault];
    
    UINavigationController *tnc = [[UIStoryboard storyboardWithName:@"AllTask" bundle:nil] instantiateInitialViewController];
    [tnc.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bar"] forBarMetrics:UIBarMetricsDefault];
    
    UINavigationController *pnc = [[UIStoryboard storyboardWithName:@"AllProject" bundle:nil] instantiateInitialViewController];
    [pnc.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bar"] forBarMetrics:UIBarMetricsDefault];
    
    UINavigationController *unc = [[UIStoryboard storyboardWithName:@"UserCenter" bundle:nil] instantiateInitialViewController];
    [unc.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bar"] forBarMetrics:UIBarMetricsDefault];
    
    self.viewControllers = @[mtnc,tnc,pnc,unc];
    
    
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:9],NSForegroundColorAttributeName:kDefaultTextColor} forState:UIControlStateNormal];//默认
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:9],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];//选中的文字颜色

    
    for (int i = 0; i < self.tabBar.items.count; i ++) {
        UITabBarItem *item = self.tabBar.items[i];
        switch (i) {
            case 0:{
                item.image = [[UIImage imageNamed:@"tab_icon1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                item.selectedImage = [[UIImage imageNamed:@"tab_icon1_"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                item.title = @"我的任务";
                
            }
                break;
            case 1:{
                item.image = [[UIImage imageNamed:@"tab_icon2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                item.selectedImage = [[UIImage imageNamed:@"tab_icon2_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                item.title = @"所有任务";
            }
                break;
            case 2:{
                item.image = [[UIImage imageNamed:@"tab_icon3"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                item.selectedImage = [[UIImage imageNamed:@"tab_icon3_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                item.title = @"所有项目";
            }
                break;
            case 3:{
                item.image = [[UIImage imageNamed:@"tab_icon4"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                item.selectedImage = [[UIImage imageNamed:@"tab_icon4_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
    //UINavigationController *lnc = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [self presentViewController:loginNC animated:YES completion:nil];
    [loginNC.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bar"] forBarMetrics:UIBarMetricsDefault];
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]};
    loginNC.navigationBar.titleTextAttributes = dic;
    
}

@end
