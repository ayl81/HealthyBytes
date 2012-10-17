//
//  TestLocationAnnotation.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/16/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface TestLocationAnnotation : NSObject <MKAnnotation>
{
    NSString *testLocationName;
    CLLocationCoordinate2D coordinateOfTestLocation;
}

@property (nonatomic, retain) NSString *testLocationName;
@property (nonatomic) CLLocationCoordinate2D coordinateOfTestLocation;

@end
