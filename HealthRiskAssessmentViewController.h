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
#import "GenderPickerView.h"
#import "HeightPickerView.h"
#import "WeightPickerView.h"
#import "YesNoPickerView.h"
#import "BloodPressurePickerView.h"
#import "CholesterolPickerView.h"
#import "SmokeInfoViewController.h"
#import "HbA1cPickerView.h"

@interface HealthRiskAssessmentViewController : UITableViewController <UIGestureRecognizerDelegate>
{
    HealthRiskAssessmentQuestions *healthRiskAssessmentQuestions;
    
    UIActionSheet *actionSheet;
    UIActionSheet *smokeActionSheet;
    CGRect pickerFrame;
    AgePickerView *agePickerView;
    GenderPickerView *genderPickerView;
    HeightPickerView *heightPickerView;
    WeightPickerView *weightPickerView;
    YesNoPickerView *smokePickerView;
    YesNoPickerView *heartAttackPickerView;
    YesNoPickerView *strokePickerView;
    YesNoPickerView *diabetesPickerView;
    BloodPressurePickerView *systolicPickerView;
    BloodPressurePickerView *diastolicPickerView;
    CholesterolPickerView *totalPickerView;
    CholesterolPickerView *hdlPickerView;
    CholesterolPickerView *ldlPickerView;
    HbA1cPickerView *hbA1cPickerView;
    
    UITapGestureRecognizer *tap;
    UILabel *smokeLabel;
    UILabel *heartAttackLabel;
    UILabel *diabetesLabel;
    
    // selected data
    NSString *age;
    NSString *gender;
    NSString *height;
    NSString *weight;
    NSString *smoke;
    NSString *heartAttack;
    NSString *stroke;
    NSString *diabetes;
    NSString *systolic;
    NSString *diastolic;
    NSString *totalCholesterol;
    NSString *hdl;
    NSString *ldl;
    NSString *HbA1c;
    
    UIColor *colorOfInfoCells;
}
- (void)dismissAgeActionSheet:(id)sender;
- (void)dismissGenderActionSheet:(id)sender;
- (void)dismissHeightActionSheet:(id)sender;
- (void)dismissWeightActionSheet:(id)sender;

@property (nonatomic, retain) HealthRiskAssessmentQuestions *healthRiskAssessmentQuestion;
@property (nonatomic, retain) UIActionSheet *actionSheet;
@property (nonatomic, retain) UIActionSheet *smokeActionSheet;
@property (nonatomic, retain) AgePickerView *agePickerView;
@property (nonatomic, retain) GenderPickerView *genderPickerView;
@property (nonatomic, retain) HeightPickerView *heightPickerView;
@property (nonatomic, retain) WeightPickerView *weightPickerView;
@property (nonatomic, retain) YesNoPickerView *smokePickerView;
@property (nonatomic, retain) YesNoPickerView *heartAttackPickerView;
@property (nonatomic, retain) YesNoPickerView *strokePickerView;
@property (nonatomic, retain) YesNoPickerView *diabetesPickerView;
@property (nonatomic, retain) BloodPressurePickerView *systolicPickerView;
@property (nonatomic, retain) BloodPressurePickerView *diastolicPickerView;
@property (nonatomic, retain) CholesterolPickerView *totalCholesterolPickerView;
@property (nonatomic, retain) CholesterolPickerView *hdlPickerView;
@property (nonatomic, retain) CholesterolPickerView *ldlPickerView;
@property (nonatomic, retain) HbA1cPickerView *hbA1cPickerView;
@property (nonatomic) CGRect pickerFrame;
@property (nonatomic, retain) NSString *age;
@property (nonatomic, retain) NSString *gender;
@property (nonatomic, retain) NSString *height;
@property (nonatomic, retain) NSString *weight;
@property (nonatomic, retain) NSString *smoke;
@property (nonatomic, retain) NSString *heartAttack;
@property (nonatomic, retain) NSString *stroke;
@property (nonatomic, retain) NSString *diabetes;
@property (nonatomic, retain) NSString *systolic;
@property (nonatomic, retain) NSString *diastolic;
@property (nonatomic, retain) NSString *totalCholesterol;
@property (nonatomic, retain) NSString *hdl;
@property (nonatomic, retain) NSString *ldl;
@property (nonatomic, retain) NSString *HbA1c;

@property (nonatomic, retain) UITapGestureRecognizer *tap;

@property (nonatomic, retain) UILabel *smokeLabel;
@property (nonatomic, retain) UILabel *heartAttackLabel;
@property (nonatomic, retain) UILabel *diabetesLabel;

@end
