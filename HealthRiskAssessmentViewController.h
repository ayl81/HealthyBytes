//
//  HealthRiskAssessmentViewController.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/19/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HealthRiskAssessmentQuestions.h"

@interface HealthRiskAssessmentViewController : UITableViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    HealthRiskAssessmentQuestions *healthRiskAssessmentQuestions;
    UIActionSheet *actionSheet;
    NSInteger age;
}
- (void)dismissActionSheet;
@property (nonatomic, retain) HealthRiskAssessmentQuestions *healthRiskAssessmentQuestion;
@property (nonatomic, retain) UIActionSheet *actionSheet;

@end
