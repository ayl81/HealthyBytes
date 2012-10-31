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
    NSString *phone;
    NSString *address1;
    NSString *address2;
    NSString *city;
    NSString *state;
    NSString *zipcode;
    NSString *website;
    
    
}

@property (nonatomic, retain) NSString *testLocationName;
@property (nonatomic) CLLocationCoordinate2D coordinateOfTestLocation;
@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSString *address1;
@property (nonatomic, retain) NSString *address2;
@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *state;
@property (nonatomic, retain) NSString *zipcode;
@property (nonatomic, retain) NSString *website;
@end
