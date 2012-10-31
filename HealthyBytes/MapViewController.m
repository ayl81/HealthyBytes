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
        
        testLocationAnnotation.phone = [testLocation objectForKey:@"phone"];
        testLocationAnnotation.address1 = [testLocation objectForKey:@"address1"];
        testLocationAnnotation.address2 = [testLocation objectForKey:@"address2"];
        testLocationAnnotation.city = [testLocation objectForKey:@"city"];
        testLocationAnnotation.zipcode = [testLocation objectForKey:@"zip"];
        testLocationAnnotation.website = [testLocation objectForKey:@"url"];
        
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
    NSString* testLocationAnnotationIdentifier = [NSString stringWithFormat:@"%@", self.locationName];
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
                        action:@selector(showDetails)
              forControlEvents:UIControlEventTouchUpInside];
        customPinView.rightCalloutAccessoryView = rightButton;
        return customPinView;
    }
    return nil;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    TestLocationAnnotation *tla = (TestLocationAnnotation *) view.annotation;
    NSLog(@"title of annotation: %@", tla.title);
    NSLog(@"phone of annotation: %@", tla.phone);
    NSLog(@"address 1 of annotation: %@", tla.address1);
    NSLog(@"address 2 of annotation: %@", tla.address2);
    NSLog(@"city of annotation: %@", tla.city);
    NSLog(@"state of annotation: %@", tla.state);
    NSLog(@"zip code of annotation: %@", tla.zipcode);
    NSLog(@"website of annotation: %@", tla.website);
	
    ABPersonViewController *personController = [[ABPersonViewController alloc] init];
    personController.displayedPerson = (ABRecordRef)[self buildContact:tla];
    personController.allowsActions = YES;
    personController.allowsEditing = NO;
    [self.navigationController pushViewController:personController animated:YES];
}

-(ABRecordRef)buildContact:(TestLocationAnnotation *)tla
{
    ABRecordRef person = ABPersonCreate();
    CFErrorRef  error = NULL;
    
    // name of contact
    if (tla.testLocationName)
        ABRecordSetValue(person, kABPersonFirstNameProperty, (__bridge CFTypeRef)(tla.testLocationName), NULL);
    
    // phone
    /*if (tla.phone)
        ABRecordSetValue(person, kABPersonPhoneMainLabel, @"(555) 555-1234", NULL);*/
   
    // address
    ABMutableMultiValueRef address = ABMultiValueCreateMutable(kABMultiDictionaryPropertyType);
    NSMutableDictionary *addressDict = [[NSMutableDictionary alloc] init];
    if (tla.address1)
        [addressDict setObject:[NSString stringWithFormat:@"%@", tla.address1] forKey:(NSString *)kABPersonAddressStreetKey];
    if (tla.city)
        [addressDict setObject:[NSString stringWithFormat:@"%@", tla.city] forKey:(NSString *)kABPersonAddressCityKey];
    if (tla.state)
        [addressDict setObject:[NSString stringWithFormat:@"%@", tla.state] forKey:(NSString *)kABPersonAddressStateKey];
    if (tla.zipcode)
        [addressDict setObject:[NSString stringWithFormat:@"%@", tla.zipcode] forKey:(NSString *)kABPersonAddressZIPKey];
    
    ABMultiValueAddValueAndLabel(address, CFBridgingRetain(addressDict), kABWorkLabel, NULL);
    ABRecordSetValue(person, kABPersonAddressProperty, address, &error);
    
    // URL
    /*(if (tla.website)
        ABRecordSetValue(person, kABPersonURLProperty, (__bridge CFTypeRef)(tla.website), NULL);*/
    
    return person;
}

- (void)showDetails
{
}


@end
