//
//  RiskResultsViewController.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/28/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "RiskResultsViewController.h"
#import "HomeViewController.h"

@implementation RiskResultsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(goHome)];
        self.navigationItem.rightBarButtonItem = anotherButton;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Risk Assessment";
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

-(IBAction)nextLabel:(id)sender
{
    [self.navigationController pushViewController:[[RiskResultsViewController2 alloc] init] animated:YES];
}

-(void)goHome
{
    HomeViewController *hvc = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    hvc.profileCreated = YES;
    [self.navigationController pushViewController:hvc animated:YES];
}

@end
