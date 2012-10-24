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

@interface HealthRiskAssessmentViewController : UITableViewController
{
    HealthRiskAssessmentQuestions *healthRiskAssessmentQuestions;
    
    UIActionSheet *actionSheet;
    CGRect pickerFrame;
    AgePickerView *agePickerView;
    GenderPickerView *genderPickerView;
    HeightPickerView *heightPickerView;
    WeightPickerView *weightPickerView;
    YesNoPickerView *smokePickerView;
    
    // selected data
    NSInteger age;
    NSString *gender;
    NSInteger height;
    NSInteger weight;
    NSString *smoke;
    NSString *heartAttack;
    NSString *stroke;
    NSString *diabetes;
    NSInteger systolic;
    NSInteger diastolic;
    NSInteger totalCholesterol;
    NSInteger hdl;
    NSInteger ldl;
}
- (void)dismissAgeActionSheet:(id)sender;
- (void)dismissGenderActionSheet:(id)sender;
- (void)dismissHeightActionSheet:(id)sender;
- (void)dismissWeightActionSheet:(id)sender;

@property (nonatomic, retain) HealthRiskAssessmentQuestions *healthRiskAssessmentQuestion;
@property (nonatomic, retain) UIActionSheet *actionSheet;
@property (nonatomic, retain) AgePickerView *agePickerView;
@property (nonatomic, retain) GenderPickerView *genderPickerView;
@property (nonatomic, retain) HeightPickerView *heightPickerView;
@property (nonatomic, retain) WeightPickerView *weightPickerView;
@property (nonatomic, retain) YesNoPickerView *smokePickerView;
@property (nonatomic) CGRect pickerFrame;
@property (nonatomic) NSInteger age;
@property (nonatomic, retain) NSString *gender;
@property (nonatomic) NSInteger height;
@property (nonatomic) NSInteger weight;
@property (nonatomic, retain) NSString *smoke;
@property (nonatomic, retain) NSString *heartAttack;
@property (nonatomic, retain) NSString *stroke;
@property (nonatomic, retain) NSString *diabetes;
@property (nonatomic) NSInteger systolic;
@property (nonatomic) NSInteger diastolic;
@property (nonatomic) NSInteger totalCholesterol;
@property (nonatomic) NSInteger hdl;
@property (nonatomic) NSInteger ldl;

@end
