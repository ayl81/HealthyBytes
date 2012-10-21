//
//  HealthRiskAssessmentQuestions.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/20/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "HealthRiskAssessmentQuestions.h"

@implementation HealthRiskAssessmentQuestions
@synthesize physicalQuestions, healthQuestions, bloodPressureQuestions, cholesterolQuestions;

- (id) init
{
    if (self = [super init])
    {
        [self createHealthAssessmentQuestions];
    }
    return self;
}

- (void) createHealthAssessmentQuestions
{
    self.physicalQuestions = [[NSArray alloc] initWithObjects:@"Age", @"Gender", @"Height", @"Weight", @"Do you smoke?", nil];
    self.healthQuestions = [[NSArray alloc] initWithObjects:@"Heart Attack?", @"Stroke?", @"Diabetes?", nil];
    self.bloodPressureQuestions = [[NSArray alloc] initWithObjects:@"Systolic", @"Diastolic", nil];
    self.cholesterolQuestions = [[NSArray alloc] initWithObjects:@"Total", @"HDL", @"LDL", nil];
}
@end
