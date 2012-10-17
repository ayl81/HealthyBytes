//
//  FindTestLocationsViewController.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/16/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"
#import "MapViewController.h"

#define SureScriptAPIKey @"3a0a572b-4f5d-47a2-9a75-819888576454"
#define MAX_RESULTS 10

@interface FindTestLocationsViewController : UIViewController <CLLocationManagerDelegate, UIScrollViewDelegate>
{
    CLLocationManager *locationManager;
    CLLocation *location ;
    double lonFindTestLocations;
    double latFindTestLocations;
    NSArray *testLocations;
    IBOutlet UITextField *searchStringTextField;
}

- (IBAction) findTestLocationsWithCurrentLocation:(id)sender;
- (IBAction) findTestLocationsWithCoordinates:(id)sender;
- (IBAction) doneEditing:(id)sender;
- (NSDictionary *)sureScriptQuery;

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) CLLocation *location;
@property (nonatomic, strong) IBOutlet UITextField *searchStringTextField;


@end
