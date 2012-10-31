//
//  AppDelegate.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/16/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HealthRiskAssessmentViewController.h"
#import "HealthRiskAssessmentQuestions.h"
#import "WelcomeViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HealthRiskAssessmentViewController *healthRiskAssessmentViewController;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) WelcomeViewController *welcomeViewController;

@end
