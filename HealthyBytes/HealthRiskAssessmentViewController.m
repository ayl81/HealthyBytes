//
//  HealthRiskAssessmentViewController.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/18/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "HealthRiskAssessmentViewController.h"

@interface HealthRiskAssessmentViewController ()

@end

@implementation HealthRiskAssessmentViewController

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

@end
