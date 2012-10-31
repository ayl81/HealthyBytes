//
//  AppDelegate.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/16/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize navigationController, welcomeViewController, window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    /*if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.healthRiskAssessmentViewController = [[HealthRiskAssessmentViewController alloc] initWithNibName:@"HealthRiskAssessmentViewController" bundle:nil];
    } else {
        self.healthRiskAssessmentViewController = [[HealthRiskAssessmentViewController alloc] initWithNibName:@"HealthRiskAssessmentViewController_iPad" bundle:nil];
    }*/

    self.welcomeViewController = [[WelcomeViewController alloc] initWithNibName:@"WelcomeViewController" bundle:nil];
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.welcomeViewController];
   // self.healthRiskAssessmentViewController.healthRiskAssessmentQuestion = [[HealthRiskAssessmentQuestions alloc] init];
    //self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.healthRiskAssessmentViewController];
    [self.window addSubview:self.navigationController.view];
    
    self.window.rootViewController = self.welcomeViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
