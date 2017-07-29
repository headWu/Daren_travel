//
//  MainTabBarController.m
//  Daren_travel
//
//  Created by app le on 2017/7/22.
//  Copyright © 2017年 InformationTeam. All rights reserved.
//

#import "MainTabBarController.h"

//三个主界面
#import "FirstViewController.h"
#import "SeconedViewController.h"
#import "ThirdViewController.h"
//自定义tabbar
#import "TabbarView.h"

@interface MainTabBarController ()

@property (nonatomic,strong)TabbarView *customTabbar;
@property (nonatomic,strong)NSMutableArray *viewControllerss;


@end

@implementation MainTabBarController

- (TabbarView *)customTabbar {
    if (!_customTabbar) {
        TabbarView *tabbar = [[TabbarView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 49)];
        tabbar.backgroundColor = [UIColor whiteColor];
        self.customTabbar = tabbar;
        
        __weak typeof (self) weakSelf = self;
        _customTabbar.Block = ^(NSInteger index){
            
            weakSelf.selectedIndex = index;
            
        };
        
        [self.tabBar addSubview:tabbar];
    }
    return _customTabbar;
}
//删除重复视图
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    for (UIView *view in self.tabBar.subviews) {
        Class tabBarButtonClass = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:tabBarButtonClass]) {
            [view removeFromSuperview];
        }
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 视图控制器名字
    NSArray *name = @[@"FirstViewController",@"SeconedViewController",@"ThirdViewController"];
    
    //图片名字
    
    NSArray *imgName = @[@"首页-未选中",@"周边-未选中",@"圆角矩形-3"];
    NSArray *selImgName = @[@"首页-选中",@"周边-选中-",@"我的-选中"];
    //标题名字
    NSArray *titleName = @[@"首页",@"周边",@"我的"];
    for (NSString *VCname in name) {
        Class vcClass = NSClassFromString(VCname);
        if ([VCname isEqualToString:@"SeconedViewController"]||[VCname isEqualToString:@"ThirdViewController"]) {
            UIStoryboard *storyB = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            
            UIViewController *VC = [storyB instantiateViewControllerWithIdentifier:VCname];
            NSInteger index = [name indexOfObject:VCname];
            VC.title = titleName[index];
            [VC.tabBarItem setImage:[[UIImage imageNamed:imgName[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            [VC.tabBarItem setSelectedImage:[[UIImage imageNamed:selImgName[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
            
            
            [VC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:14]} forState:UIControlStateNormal];
            
            [VC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor],NSFontAttributeName:[UIFont systemFontOfSize:14]} forState:UIControlStateSelected];
            
            self.customTabbar.tabbarIt = VC.tabBarItem;
            
            [self addChildViewController:nav];
            
        }else {
            UIViewController *VC = [[vcClass alloc] init];
            NSInteger index = [name indexOfObject:VCname];
            VC.title = titleName[index];
            [VC.tabBarItem setImage:[[UIImage imageNamed:imgName[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            [VC.tabBarItem setSelectedImage:[[UIImage imageNamed:selImgName[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
            
            
            [VC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:14]} forState:UIControlStateNormal];
            
            [VC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor],NSFontAttributeName:[UIFont systemFontOfSize:14]} forState:UIControlStateSelected];
            
            self.customTabbar.tabbarIt = VC.tabBarItem;
            
            [self addChildViewController:nav];

        }
        
       
    }
    
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

@end
