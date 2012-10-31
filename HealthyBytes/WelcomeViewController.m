//
//  WelcomeViewController.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/28/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "WelcomeViewController.h"



@implementation WelcomeViewController

@synthesize healthRiskAssessmentViewController;

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
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Welcome";
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

-(IBAction)start:(id)sender
{
    self.healthRiskAssessmentViewController = [[HealthRiskAssessmentViewController alloc] initWithNibName:@"HealthRiskAssessmentViewController" bundle:nil];
    self.healthRiskAssessmentViewController.healthRiskAssessmentQuestion = [[HealthRiskAssessmentQuestions alloc] init];
    [self.navigationController pushViewController:self.healthRiskAssessmentViewController animated:YES];
}

-(IBAction)loginButtonAction:(id)sender
{
    LoginViewController *lvc = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:lvc animated:YES];
}

@end
