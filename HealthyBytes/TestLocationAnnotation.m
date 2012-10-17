//
//  TestLocationAnnotation.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/16/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "TestLocationAnnotation.h"


@implementation TestLocationAnnotation

@synthesize testLocationName, coordinateOfTestLocation;

- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = self.coordinateOfTestLocation.latitude;
    theCoordinate.longitude = self.coordinateOfTestLocation.longitude;
    return theCoordinate;
}

- (NSString *)title
{
    return self.testLocationName;
}


@end
