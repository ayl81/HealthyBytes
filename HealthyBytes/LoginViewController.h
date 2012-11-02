//
//  LoginViewController.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/31/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeViewController;

@interface LoginViewController : UIViewController<UITextFieldDelegate>

-(IBAction)loginButtonAction:(id)sender;

@property(nonatomic, retain) IBOutlet UITextField *emailTextField;
@property(nonatomic, retain) IBOutlet UITextField *passwordTextField;

@end
