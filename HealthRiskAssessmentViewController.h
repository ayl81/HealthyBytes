//
//  HealthRiskAssessmentViewController.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/19/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HealthRiskAssessmentQuestions.h"
#import "AgePickerView.h"

@interface HealthRiskAssessmentViewController : UITableViewController
{
    HealthRiskAssessmentQuestions *healthRiskAssessmentQuestions;
    UIActionSheet *actionSheet;
    CGRect pickerFrame;
    NSInteger age;
}
- (void)dismissActionSheet;
@property (nonatomic, retain) HealthRiskAssessmentQuestions *healthRiskAssessmentQuestion;
@property (nonatomic, retain) UIActionSheet *actionSheet;
@property (nonatomic) CGRect pickerFrame;
@end
