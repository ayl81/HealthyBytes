//
//  HealthRiskAssessmentViewController.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/19/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HealthRiskAssessmentQuestions.h"

@interface HealthRiskAssessmentViewController : UITableViewController
{
    HealthRiskAssessmentQuestions *healthRiskAssessmentQuestions;
}

@property (nonatomic, retain) NSArray *colorNames;
@property (nonatomic, retain) HealthRiskAssessmentQuestions *healthRiskAssessmentQuestion;
@end
