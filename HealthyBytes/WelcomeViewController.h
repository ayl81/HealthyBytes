//
//  WelcomeViewController.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/28/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HealthRiskAssessmentViewController.h"

@interface WelcomeViewController : UIViewController
{
    HealthRiskAssessmentViewController *healthRiskAssessmentViewController;
}

@property (nonatomic, retain) HealthRiskAssessmentViewController *healthRiskAssessmentViewController;

-(IBAction)start:(id)sender;

@end