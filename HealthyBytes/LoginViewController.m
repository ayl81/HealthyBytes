//
//  LoginViewController.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/31/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"

@implementation LoginViewController
@synthesize emailTextField, passwordTextField;

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

-(IBAction)loginButtonAction:(id)sender
{
    HomeViewController *hvc = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    hvc.profileCreated = YES;
    [self.navigationController pushViewController:hvc animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
