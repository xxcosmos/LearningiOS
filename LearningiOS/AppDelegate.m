//
//  AppDelegate.m
//  LearningiOS
//
//  Created by 张啸宇 on 2019/11/26.
//  Copyright © 2019 xiaoyuu. All rights reserved.
//

#import "AppDelegate.h"
#import "GTNewsViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    GTNewsViewController *viewController = [[GTNewsViewController alloc] init];
    GTVideoViewController *videoController = [[GTVideoViewController alloc]init];
    GTRecommendViewController * recommendController = [[GTRecommendViewController alloc]init];
    
   
    
    UIViewController *mineViewController = [[UIViewController alloc]init];
    mineViewController.view.backgroundColor = [UIColor blackColor];
    mineViewController.tabBarItem.title = @"我的";
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    [tabbarController setViewControllers:@[viewController,videoController,recommendController,mineViewController]];
    tabbarController.delegate = self;
    
    UINavigationController *navigationController =[[UINavigationController alloc] initWithRootViewController:tabbarController];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"did select view controller");
}

#pragma mark - UISceneSession lifecycle




@end
