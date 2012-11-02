//
//  MapViewController.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/16/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestLocationAnnotation.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@class HomeViewController;

@interface MapViewController : UIViewController <MKMapViewDelegate, ABPersonViewControllerDelegate>
{
    MKMapView *mapView;
    NSArray *testLocations;
    NSString *locationName;
}

- (void)showDetails:(id)sender;

@property (nonatomic, retain) NSArray *testLocations;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) NSString *locationName;

@end
