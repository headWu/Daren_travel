//
//  FirstViewController.m
//  Daren_travel
//
//  Created by app le on 2017/7/22.
//  Copyright © 2017年 InformationTeam. All rights reserved.
//

#import "FirstViewController.h"

#import "background_View.h"

#import "ScanCodeViewController.h"

@interface FirstViewController ()

@property (nonatomic,strong)background_View *bg_view;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LOGO";
    [self creatButton];
    // Do any additional setup after loading the view.
   
    
    BMKMapView *mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 0, Main_Width, Main_Height)];
        self.view = mapView;
    
     [self creatUI];
}


- (void)creatButton {
    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbtn.frame = CGRectMake(10, 20, 60, 20);
    [leftbtn setTitle:@"成都" forState:UIControlStateNormal];
    [leftbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:leftbtn];
    self.navigationItem.leftBarButtonItem = item;
    
    UIButton *rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame = CGRectMake(Main_Width - 70, 20, 60, 20);
    [rightbtn setTitle:@"扫描" forState:UIControlStateNormal];
    [rightbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightbtn addTarget: self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right_Item = [[UIBarButtonItem alloc] initWithCustomView:rightbtn];
    self.navigationItem.rightBarButtonItem = right_Item;
}

- (void)rightClick:(UIButton *)btn {
    
    UIStoryboard *storyB = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ScanCodeViewController *scanVC = [storyB instantiateViewControllerWithIdentifier:@"ScanCodeViewController"];
    [self.navigationController pushViewController:scanVC animated:YES];
}
- (void)creatUI {
    _bg_view = [[background_View alloc] initWithFrame:CGRectMake(0, Main_Height/2 - 44, Main_Width, Main_Height/2)];
    [self.view addSubview:_bg_view];
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
