//
//  HealthRiskAssessmentQuestions.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/20/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthRiskAssessmentQuestions : NSObject
{
    NSArray *physicalQuestions;
    NSArray *healthQuestions;
    NSArray *bloodPressureQuestions;
    NSArray *cholesterolQuestions;
}

@property (nonatomic, retain) NSArray *physicalQuestions;
@property (nonatomic, retain) NSArray *healthQuestions;
@property (nonatomic, retain) NSArray *bloodPressureQuestions;
@property (nonatomic, retain) NSArray *cholesterolQuestions;

@end
