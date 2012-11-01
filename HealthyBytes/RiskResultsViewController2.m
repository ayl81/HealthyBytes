//
//  RiskResultsViewController2.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/31/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "RiskResultsViewController2.h"
#import "HomeViewController.h"

@interface RiskResultsViewController2 ()

@end

@implementation RiskResultsViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(goHome)];
        self.navigationItem.rightBarButtonItem = anotherButton;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

-(IBAction)findTestLocations:(id)sender
{
    [self.navigationController pushViewController:[[FindTestLocationsViewController alloc] init] animated:YES];
}

-(void)goHome
{
    HomeViewController *hvc = [[HomeViewController alloc] initWithNibName:@"HomeViewcontroller" bundle:nil];
    hvc.profileCreated = YES;
    [self.navigationController pushViewController:hvc animated:YES];
}
@end
