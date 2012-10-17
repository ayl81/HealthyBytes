//
//  FindTestLocationsViewController.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/16/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "FindTestLocationsViewController.h"

@implementation FindTestLocationsViewController

@synthesize locationManager, location, searchStringTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    searchStringTextField = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction) findTestLocationsWithCurrentLocation:(id)sender
{
    if (locationManager == nil)
    {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
        [locationManager setDelegate:self];
    }
    
	[[self locationManager] startUpdatingLocation];
    location = [locationManager location];
    
    CLLocationCoordinate2D coordinate = [location coordinate];             
    latFindTestLocations = coordinate.latitude;
    lonFindTestLocations = coordinate.longitude;
	NSLog (@"longitude is: %f; latitude is: %f", lonFindTestLocations, lonFindTestLocations);
    
    MapViewController *mapViewController = [[MapViewController alloc] init];
    mapViewController.testLocations = [[self sureScriptQuery] valueForKey:@"providers"];
    [self.navigationController pushViewController:mapViewController animated:YES];
}

- (IBAction) findTestLocationsWithCoordinates:(id)sender
{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];

    [geocoder geocodeAddressString:self.searchStringTextField.text completionHandler:^(NSArray *placemarks, NSError *error)
     {
         NSLog(@"geocodeAddressString:completionHandler: Completion Handler called!");
         if (error){
             NSLog(@"Geocode failed with error: %@", error);
             return;
         }
         
         NSLog(@"Received placemarks: %@", placemarks);
         
         CLLocationCoordinate2D coordinate = [location coordinate];
         latFindTestLocations = coordinate.latitude;
         lonFindTestLocations = coordinate.longitude;
         NSLog (@"longitude is: %f; latitude is: %f", lonFindTestLocations, lonFindTestLocations);
         
         MapViewController *mapViewController = [[MapViewController alloc] init];
         mapViewController.testLocations = [[self sureScriptQuery] valueForKey:@"providers"];
         [self.navigationController pushViewController:mapViewController animated:YES];
     }];
}

// Get Surescript results
- (NSArray *)sureScriptQuery
{
    latFindTestLocations = 44.979965;           // dummy data
    lonFindTestLocations =-93.263836;           // dummy data
    
    NSString *urlString = [NSString stringWithFormat:@"https://millionhearts.surescripts.net/test/Provider/Find?apikey=%@&lat=%f&lon=%f&radius=2&maxResults=%d", SureScriptAPIKey, latFindTestLocations, lonFindTestLocations, MAX_RESULTS];
    NSLog(@"urlString: %@", urlString);
    NSString *json = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"return value: %@", json);
	return [json JSONValue];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    // Configure the new event with information from the location.
    CLLocationCoordinate2D coordinate = [location coordinate];
	NSLog (@"new longitude is: %f; new latitude is: %f", coordinate.longitude, coordinate.latitude);
    [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [self.locationManager stopUpdatingLocation];
    NSLog (@"location manager did not find a location...");
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // dismiss the keyboard upon a scroll
    [self.searchStringTextField resignFirstResponder];
}

@end
