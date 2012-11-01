//
//  ProfileViewController.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/31/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

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
    self.navigationItem.title = @"Profile";
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

-(IBAction)remindMeButtonAction:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]    initWithTitle:nil
                                                                delegate:nil
                                                       cancelButtonTitle:nil
                                                  destructiveButtonTitle:nil
                                                       otherButtonTitles:nil];
    
    [actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    [actionSheet addButtonWithTitle:@"Add to Google Calendar"];
    [actionSheet addButtonWithTitle:@"Email me periodically"];
    [actionSheet addButtonWithTitle:@"Cancel"];
    [actionSheet showInView:self.view];
}

-(IBAction)sendResultsButtonAction:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]    initWithTitle:nil
                                                                delegate:nil
                                                       cancelButtonTitle:nil
                                                  destructiveButtonTitle:nil
                                                       otherButtonTitles:nil];
    
    [actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    [actionSheet addButtonWithTitle:@"Email Me"];
    [actionSheet addButtonWithTitle:@"Text Me"];
    [actionSheet addButtonWithTitle:@"Email My Doctor"];
    [actionSheet addButtonWithTitle:@"Copy to Microsoft Vault"];
    [actionSheet addButtonWithTitle:@"Cancel"];
    [actionSheet showInView:self.view];
}

@end
