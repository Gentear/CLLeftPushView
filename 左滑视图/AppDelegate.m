//
//  AppDelegate.m
//  左滑视图
//
//  Created by enter on 15/12/7.
//  Copyright © 2015年 enter. All rights reserved.
//

#import "AppDelegate.h"
#import "leftController.h"
#import "rightController.h"
#import "midController.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    leftController * leftVC = [[leftController alloc] init];
    //UINavigationController * leftNC = [[UINavigationController alloc] initWithRootViewController:leftVC];
    
//    rightController * rightVC = [[rightController alloc] init];
    //UINavigationController * rightNC = [[UINavigationController alloc] initWithRootViewController:rightVC];
    
    midController * midVC = [[midController alloc] init];
    UINavigationController * midNC = [[UINavigationController alloc] initWithRootViewController:midVC];
    
    
    ViewController * rootVC = [[ViewController alloc] init];
    //UINavigationController * rootNC = [[UINavigationController alloc] initWithRootViewController:rootVC];
    rootVC.leftController = leftVC;
//    rootVC.rightViewController = rightVC;
    rootVC.midController = midNC;
    
    self.window.rootViewController = rootVC;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
