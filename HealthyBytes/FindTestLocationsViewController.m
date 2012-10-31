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

#pragma mark -
#pragma mark - IBActions
- (IBAction)doneEditing:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction) findTestLocationsWithCurrentLocation:(id)sender
{
    if (self.locationManager == nil)
    {
        self.locationManager = [[CLLocationManager alloc] init];
        [self.locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
        [self.locationManager setDelegate:self];
    }
    
	[self.locationManager startUpdatingLocation];
    self.location = [locationManager location];
    
    CLLocationCoordinate2D coordinate = [self.location coordinate];
    latFindTestLocations = coordinate.latitude;
    lonFindTestLocations = coordinate.longitude;
	NSLog (@"longitude is: %f; latitude is: %f", lonFindTestLocations, lonFindTestLocations);
   
    MapViewController *mapViewController = [[MapViewController alloc] init];
    mapViewController.locationName = @"current location";
    mapViewController.testLocations = [[self sureScriptQuery] valueForKey:@"providers"];
    [self.navigationController pushViewController:mapViewController animated:YES];
}

- (IBAction) findTestLocationsWithCoordinates:(id)sender
{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    NSString *userInputLocation = self.searchStringTextField.text;
    [geocoder geocodeAddressString:userInputLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
         NSLog(@"geocodeAddressString:completionHandler: Completion Handler called!");
         if (error){
             NSLog(@"Geocode failed with error: %@", error);
             return;
         }
         
         NSLog(@"Received placemarks: %@", placemarks);
         
         CLPlacemark *userInputLocationPlacemark = [placemarks objectAtIndex:0];
         self.location = userInputLocationPlacemark.location;
         
         CLLocationCoordinate2D coordinate = [self.location coordinate];
         latFindTestLocations = coordinate.latitude;
         lonFindTestLocations = coordinate.longitude;
         NSLog (@"longitude is: %f; latitude is: %f", lonFindTestLocations, latFindTestLocations);
         
         MapViewController *mapViewController = [[MapViewController alloc] init];
         mapViewController.locationName = userInputLocationPlacemark.locality;
         mapViewController.testLocations = [[self sureScriptQuery] valueForKey:@"providers"];
         [self.navigationController pushViewController:mapViewController animated:YES];
     }];
}

#pragma mark -
#pragma mark - Surescript Results
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

#pragma mark -
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

#pragma mark -
#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // dismiss the keyboard upon a scroll
    [self.searchStringTextField resignFirstResponder];
}

@end
