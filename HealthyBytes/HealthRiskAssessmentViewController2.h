//
//  HealthRiskAssessmentViewController2.h
//  HealthyBytes
//
//  Created by Alda Luong on 11/1/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HealthRiskAssessmentQuestions.h"
#import "BloodPressurePickerView.h"
#import "CholesterolPickerView.h"
#import "HbA1cPickerView.h"
#import "RiskResultsViewController.h"

@class HomeViewController;

@interface HealthRiskAssessmentViewController2 : UITableViewController
{
    UIActionSheet *actionSheet;
    CGRect pickerFrame;
    
    HealthRiskAssessmentQuestions *healthRiskAssessmentQuestions;
    
    BloodPressurePickerView *systolicPickerView;
    BloodPressurePickerView *diastolicPickerView;
    CholesterolPickerView *totalPickerView;
    CholesterolPickerView *hdlPickerView;
    CholesterolPickerView *ldlPickerView;
    HbA1cPickerView *hbA1cPickerView;
    
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
}

@property (nonatomic, retain) HealthRiskAssessmentQuestions *healthRiskAssessmentQuestion;

@property (nonatomic, retain) UIActionSheet *actionSheet;
@property (nonatomic) CGRect pickerFrame;

@property (nonatomic, retain) BloodPressurePickerView *systolicPickerView;
@property (nonatomic, retain) BloodPressurePickerView *diastolicPickerView;
@property (nonatomic, retain) CholesterolPickerView *totalCholesterolPickerView;
@property (nonatomic, retain) CholesterolPickerView *hdlPickerView;
@property (nonatomic, retain) CholesterolPickerView *ldlPickerView;
@property (nonatomic, retain) HbA1cPickerView *hbA1cPickerView;
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

@end
