//
//  MapViewController.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/16/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestLocationAnnotation.h"

@interface MapViewController : UIViewController
{
    MKMapView *mapView;
    NSArray *testLocations;
}

@property (nonatomic, retain) NSArray *testLocations;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
