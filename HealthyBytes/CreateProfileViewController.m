//
//  CreateProfileViewController.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/31/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "CreateProfileViewController.h"

@implementation CreateProfileViewController

@synthesize nameTextField, emailTextField, passwordTextField;

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
    self.navigationItem.title = @"Login";
    [self.nameTextField setDelegate:self];
    [self.nameTextField setReturnKeyType:UIReturnKeyDone];
    [self.nameTextField addTarget:self
                       action:@selector(nameTextFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
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

-(IBAction)createProfileButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
