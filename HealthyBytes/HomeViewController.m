//
//  HomeViewController.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/31/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "HomeViewController.h"
#import "HealthRiskAssessmentViewController.h"

@implementation HomeViewController
@synthesize profileCreated;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.hidesBackButton = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //don't want to keep showing this -- only show if profile page has not been completed
    if (!(self.profileCreated))
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Do you want to create a profile to save your data?" delegate:self cancelButtonTitle:@"Later" otherButtonTitles:@"OK!", nil];
        [alert show];
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

- (IBAction)profileButtonAction:(id)sender
{
    ProfileViewController *pvc = [[ProfileViewController alloc] init];
    [self.navigationController pushViewController:pvc animated:YES];
}

- (IBAction)healthAssessmentButtonAction:(id)sender
{
    HealthRiskAssessmentViewController *hravc = [[HealthRiskAssessmentViewController alloc] initWithNibName:@"HealthRiskAssessmentViewController" bundle:nil];
    hravc.healthRiskAssessmentQuestion = [[HealthRiskAssessmentQuestions alloc] init];
    [self.navigationController pushViewController:hravc animated:YES];
}

- (IBAction)testLocationsButtonAction:(id)sender
{
    FindTestLocationsViewController *ftlvc = [[FindTestLocationsViewController alloc] init];
    [self.navigationController pushViewController:ftlvc animated:YES];
}

- (IBAction)infoButtonAction:(id)sender
{
    InfoViewController *ivc = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    [self.navigationController pushViewController:ivc animated:YES];
}

// UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Pressed: %d", buttonIndex);
    if (buttonIndex == 1)
    {
        // OK button clicked
        self.profileCreated = YES;
        CreateProfileViewController *cpvc = [[CreateProfileViewController alloc] init];
        [self.navigationController pushViewController:cpvc animated:YES];
    }
}
@end
