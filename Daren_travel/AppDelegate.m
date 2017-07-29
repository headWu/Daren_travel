//
//  AppDelegate.m
//  Daren_travel
//
//  Created by app le on 2017/7/22.
//  Copyright © 2017年 InformationTeam. All rights reserved.
//

#import "AppDelegate.h"

#import "StartViewController.h"

@interface AppDelegate ()


@end


@implementation AppDelegate{
    
//    UIWindow *window;
    UINavigationController *navigationConroller;
    BMKMapManager *_mapManager;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    //百度地图注册
    _mapManager = [[BMKMapManager alloc] init];
    
    BOOL ret = [_mapManager start:@"xAr0wB1a4E2Trbb6Us0yoyQcZGBUzyc8" generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    
    [self statrView];
    
//    [self.window addSubview:navigationConroller.view];
    [self.window makeKeyAndVisible];
//    
    return YES;
}

- (void)statrView {
    
    UIStoryboard *storyB = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    StartViewController *stratVC = [storyB instantiateViewControllerWithIdentifier:@"StartViewController"];
    
    _window.rootViewController = stratVC;
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
