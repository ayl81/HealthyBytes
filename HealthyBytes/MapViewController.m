//
//  MapViewController.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/16/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

@synthesize mapView, testLocations,locationName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //mapViewController.title = [@"Test Centers Near " stringByAppendingString:userInputLocationPlacemark.locality];
    UILabel* tlabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 300, 40)];
    tlabel.text = [@"Test centers near " stringByAppendingString:self.locationName]; 
    tlabel.textColor = [UIColor whiteColor];
    tlabel.backgroundColor = [UIColor clearColor];
    //tlabel.font = [UIFont boldSystemFontOfSize:16.0];
    tlabel.adjustsFontSizeToFitWidth = YES;
    self.navigationItem.titleView = tlabel;
    
    // to show the user location
    self.mapView.showsUserLocation = YES;
    
    // Do any additional setup after loading the view from its nib.
    NSEnumerator *e = [testLocations objectEnumerator];
    NSDictionary *testLocation;
    while (testLocation = [e nextObject])
    {
        TestLocationAnnotation *testLocationAnnotation = [[TestLocationAnnotation alloc] init];
        
        CLLocationCoordinate2D testLocationCoordinate;
        testLocationCoordinate.longitude = [[testLocation objectForKey:@"lon"] doubleValue];
        testLocationCoordinate.latitude = [[testLocation objectForKey:@"lat"] doubleValue];
        testLocationAnnotation.coordinateOfTestLocation = testLocationCoordinate;
        
        self.locationName = [testLocation objectForKey:@"name"];
        testLocationAnnotation.testLocationName = self.locationName;
        
        NSLog(@"test location lon: %f; lat: %f; name: %@", testLocationCoordinate.longitude, testLocationCoordinate.latitude, testLocationAnnotation.testLocationName);
        
        [self.mapView addAnnotation:testLocationAnnotation];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // try to dequeue an existing pin view first
    static NSString* testLocationAnnotationIdentifier = @"testLocationAnnotationIdentifier";
    MKPinAnnotationView* pinView = (MKPinAnnotationView *)
    [mapView dequeueReusableAnnotationViewWithIdentifier:testLocationAnnotationIdentifier];
    if (!pinView)
    {
        // if an existing pin view was not available, create one
        MKPinAnnotationView *customPinView = [[MKPinAnnotationView alloc]
                                               initWithAnnotation:annotation reuseIdentifier:testLocationAnnotationIdentifier];
        customPinView.pinColor = MKPinAnnotationColorPurple;
        customPinView.animatesDrop = YES;
        customPinView.canShowCallout = YES;
        
        // add a detail disclosure button to the callout which will open a new view controller page
        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton addTarget:self
                        action:@selector(showDetails:)
              forControlEvents:UIControlEventTouchUpInside];
        customPinView.rightCalloutAccessoryView = rightButton;
        
        return customPinView;
    }
    return nil;
}

@end
