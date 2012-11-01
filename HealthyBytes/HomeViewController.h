//
//  HomeViewController.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/31/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileViewcontroller.h"
//#import "HealthRiskAssessmentViewController.h"
#import "FindTestLocationsViewController.h"
#import "InfoViewController.h"

@class HealthRiskAssessmentViewController;

@interface HomeViewController : UIViewController

- (IBAction)profileButtonAction:(id)sender;
- (IBAction)healthAssessmentButtonAction:(id)sender;
- (IBAction)testLocationsButtonAction:(id)sender;
- (IBAction)infoButtonAction:(id)sender;

@property (nonatomic) BOOL profileCreated;

@end
