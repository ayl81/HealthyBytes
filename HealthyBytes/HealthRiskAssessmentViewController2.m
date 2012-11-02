//
//  HealthRiskAssessmentViewController2.m
//  HealthyBytes
//
//  Created by Alda Luong on 11/1/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "HealthRiskAssessmentViewController2.h"
#import "HomeViewController.h"

@implementation HealthRiskAssessmentViewController2
@synthesize healthRiskAssessmentQuestion, systolicPickerView, diastolicPickerView, totalCholesterolPickerView, hdlPickerView, ldlPickerView, hbA1cPickerView, systolic, diastolic, totalCholesterol, hdl, ldl, HbA1c, actionSheet, pickerFrame, age, gender, height, weight, smoke, heartAttack, stroke, diabetes;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(goHome)];
        self.navigationItem.rightBarButtonItem = anotherButton;
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // create a UIButton (Deconnect button)
    UIButton *calculateRisk = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    calculateRisk.frame = CGRectMake(0, 20, 280, 40);
    [calculateRisk setTitle:@"Calculate Risk" forState:UIControlStateNormal];
    calculateRisk.backgroundColor = [UIColor clearColor];
    [calculateRisk setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [calculateRisk addTarget:self action:@selector(calculateRiskButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    calculateRisk.tintColor = [UIColor blueColor];
    
    //create a footer view on the bottom of the tabeview
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, 280, 100)];
    [footerView addSubview:calculateRisk];
    
    self.tableView.tableFooterView = footerView;
    
    self.navigationItem.title = @"Optional";
    /*
    //create a header view on the bottom of the tableview    
    CGRect labelFrame = CGRectMake(20, 0, 280, 100);
    
    UILabel *optionalLabel = [[UILabel alloc] initWithFrame:labelFrame];
    optionalLabel.textColor = [UIColor blackColor];
    optionalLabel.textAlignment = UITextAlignmentRight;
    optionalLabel.font = [UIFont systemFontOfSize:17.0];
    optionalLabel.adjustsFontSizeToFitWidth = YES;
    optionalLabel.backgroundColor = [UIColor clearColor];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, 280, 100)];
    [headerView addSubview:calculateRisk];
    
    self.tableView.tableHeaderView = headerView;
     */
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSInteger rows = 0;
    switch (section)
    {
        case 0:
            rows = 3;           // diabetes
            break;
        case 1:
            rows = 2;           // blood pressure
            break;
        case 2:
            rows = 1;           // cholestrol
            break;
        default:
            break;
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }

    
    // Configure the cell...
    NSString *cellText = nil;
    cell.detailTextLabel.text = nil;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0)
    {
        cellText = [self.healthRiskAssessmentQuestion.cholesterolQuestions objectAtIndex:indexPath.row];
        
        switch (indexPath.row)
        {
            case 0:
                if (self.totalCholesterol)
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ mg/dL", self.totalCholesterol];
                break;
            case 1:
                if (self.hdl)
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ mg/dL", self.hdl];
                break;
            case 2:
                if (self.ldl)
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ mg/dL", self.ldl];
                break;
            default:
                break;
        }
    }
    
    if (indexPath.section == 1)
    {
        cellText = [self.healthRiskAssessmentQuestion.bloodPressureQuestions objectAtIndex:indexPath.row];

        switch (indexPath.row)
        {
            case 0:
                if (self.systolic)
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ mmHg", self.systolic];
                break;
            case 1:
                if (self.diastolic)
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ mmHg", self.diastolic];
                break;
            default:
                break;
        }
    }
    
    if (indexPath.section == 2)
    {
        cellText = @"HbA1c";
        
        switch (indexPath.row)
        {
            case 0:
                if (self.HbA1c)
                    cell.detailTextLabel.text = HbA1c;
                break;
        }
    }
    
    NSLog(@"cell text: %@; section: %d; row: %d", cellText, indexPath.section, indexPath.row);
    cell.textLabel.text = cellText;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{    
    NSString *title = nil;
    switch (section) {
        case 0:
            title = @"Cholesterol";
            break;
        case 1:
            title = @"Blood Pressure";
            break;
        case 2:
            title = @"Diabetes";
            break;
        default:
            break;
    }
    return title;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    NSString *title = nil;
    switch (section) {
        case 0:
            title = @"skip this section if you have not been screened in the last year";
            break;
        case 1:
            title = @"skip this section if you have not been screened in the last year";
            break;
        case 2:
            title = @"skip this section if you do not have diabetes";
            break;
        default:
            break;
    }
    
    return title;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.actionSheet = [[UIActionSheet alloc]  initWithTitle:nil
                                                    delegate:nil
                                           cancelButtonTitle:nil
                                      destructiveButtonTitle:nil
                                           otherButtonTitles:nil];
    
    [self.actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    self.pickerFrame = CGRectMake(0, 40, 0, 0);
    
    UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Done"]];
    closeButton.momentary = YES;
    closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
    closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
    closeButton.tintColor = [UIColor blackColor];
    
    if (indexPath.section == 2)
    {
        switch (indexPath.row)
        {
            case 0:
                self.hbA1cPickerView = [[HbA1cPickerView alloc] initWithFrame:self.pickerFrame];
                self.hbA1cPickerView.showsSelectionIndicator = YES;
                self.hbA1cPickerView.dataSource = self.hbA1cPickerView;
                self.hbA1cPickerView.delegate = self.hbA1cPickerView;
                [self.actionSheet addSubview:self.hbA1cPickerView];
                [closeButton addTarget:self action:@selector(dismissHbA1cActionSheet:) forControlEvents:UIControlEventValueChanged];
                break;
        }
    }
    
    if (indexPath.section == 1)
    {
        switch (indexPath.row)
        {
            case 0:
                self.systolicPickerView = [[BloodPressurePickerView alloc] initWithFrame:self.pickerFrame];
                self.systolicPickerView.showsSelectionIndicator = YES;
                self.systolicPickerView.dataSource = self.systolicPickerView;
                self.systolicPickerView.delegate = self.systolicPickerView;
                [self.actionSheet addSubview:self.systolicPickerView];
                [closeButton addTarget:self action:@selector(dismissSystolicActionSheet:) forControlEvents:UIControlEventValueChanged];
                break;
            case 1:
                self.diastolicPickerView = [[BloodPressurePickerView alloc] initWithFrame:self.pickerFrame];
                self.diastolicPickerView.showsSelectionIndicator = YES;
                self.diastolicPickerView.dataSource = self.diastolicPickerView;
                self.diastolicPickerView.delegate = self.diastolicPickerView;
                [self.actionSheet addSubview:self.diastolicPickerView];
                [closeButton addTarget:self action:@selector(dismissDiastolicActionSheet:) forControlEvents:UIControlEventValueChanged];
                break;
            default:
                break;
        }
    }
    
    if (indexPath.section == 0)
    {
        switch (indexPath.row)
        {
            case 0:
                self.totalCholesterolPickerView = [[CholesterolPickerView alloc] initWithFrame:self.pickerFrame];
                self.totalCholesterolPickerView.showsSelectionIndicator = YES;
                self.totalCholesterolPickerView.dataSource = self.totalCholesterolPickerView;
                self.totalCholesterolPickerView.delegate = self.totalCholesterolPickerView;
                [self.actionSheet addSubview:self.totalCholesterolPickerView];
                [closeButton addTarget:self action:@selector(dismissTotalCholesterolActionSheet:) forControlEvents:UIControlEventValueChanged];
                break;
            case 1:
                self.hdlPickerView = [[CholesterolPickerView alloc] initWithFrame:self.pickerFrame];
                self.hdlPickerView.showsSelectionIndicator = YES;
                self.hdlPickerView.dataSource = self.hdlPickerView;
                self.hdlPickerView.delegate = self.hdlPickerView;
                [self.actionSheet addSubview:self.hdlPickerView];
                [closeButton addTarget:self action:@selector(dismissHdlActionSheet:) forControlEvents:UIControlEventValueChanged];
                break;
            case 2:
                self.ldlPickerView = [[CholesterolPickerView alloc] initWithFrame:self.pickerFrame];
                self.ldlPickerView.showsSelectionIndicator = YES;
                self.ldlPickerView.dataSource = self.ldlPickerView;
                self.ldlPickerView.delegate = self.ldlPickerView;
                [self.actionSheet addSubview:self.ldlPickerView];
                [closeButton addTarget:self action:@selector(dismissLdlActionSheet:) forControlEvents:UIControlEventValueChanged];
                break;
            default:
                break;
        }
    }
    [actionSheet addSubview:closeButton];
    [self.actionSheet showInView:[[UIApplication sharedApplication] keyWindow]];
    
    [self.actionSheet setBounds:CGRectMake(0, 0, 320, 485)];
}

- (void)dismissHbA1cActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    self.HbA1c = self.hbA1cPickerView.HbA1c;
    NSLog(@"Systolic: %@", self.hbA1cPickerView.HbA1c);
    
    NSIndexPath *hba1cIP = [NSIndexPath indexPathForRow:0 inSection:2];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:hba1cIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (void)dismissSystolicActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    self.systolic = self.systolicPickerView.bp;
    NSLog(@"Systolic: %@", self.systolicPickerView.bp);
    
    NSIndexPath *systolicIP = [NSIndexPath indexPathForRow:0 inSection:1];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:systolicIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (void)dismissDiastolicActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    self.diastolic = self.diastolicPickerView.bp;
    NSLog(@"Systolic: %@", self.diastolicPickerView.bp);
    
    NSIndexPath *diastolicIP = [NSIndexPath indexPathForRow:1 inSection:1];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:diastolicIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (void)dismissTotalCholesterolActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    self.totalCholesterol = self.totalCholesterolPickerView.cholesterol;
    NSLog(@"Total Cholesterol: %@", self.totalCholesterolPickerView.cholesterol);
    
    NSIndexPath *totalIP = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:totalIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (void)dismissHdlActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    self.hdl = self.hdlPickerView.cholesterol;
    NSLog(@"HDL: %@", self.hdlPickerView.cholesterol);
    
    NSIndexPath *hdlIP = [NSIndexPath indexPathForRow:1 inSection:0];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:hdlIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (void)dismissLdlActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    self.ldl = self.ldlPickerView.cholesterol;
    NSLog(@"LDL: %@", self.ldlPickerView.cholesterol);
    
    NSIndexPath *ldlIP = [NSIndexPath indexPathForRow:2 inSection:0];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:ldlIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (IBAction)calculateRiskButtonAction:(id)sender
{
    [self queryRisks];
    RiskResultsViewController *rrvc = [[RiskResultsViewController alloc] initWithNibName:@"RiskResultsViewController" bundle:nil];
    [self.navigationController pushViewController:rrvc animated:YES];
    
}

- (void)queryRisks
{
    NSString *bodyData = [NSString stringWithFormat:@"age=%d&gender=%c&height=%d&weight=%d&smoker=%@&mi=%@&stroke=%@&diabetes=%@", [self.age integerValue], [self.gender characterAtIndex:0], [self.height integerValue], [self.weight integerValue], self.smoke, self.heartAttack, self.stroke, self.diabetes];
    NSLog(@"body data: %@", bodyData);
    
    NSMutableURLRequest *postRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://demo-indigo4health.archimedesmodel.com/IndiGO4Health/IndiGO4Health"]];
    
    // Set the request's content type to application/x-www-form-urlencoded
    [postRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    // Designate the request a POST request and specify its body data
    [postRequest setHTTPMethod:@"POST"];
    [postRequest setHTTPBody:[NSData dataWithBytes:[bodyData UTF8String] length:[bodyData length]]];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:postRequest returningResponse:&response error:&error];
    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(data);
}


-(void)goHome
{
    HomeViewController *hvc = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    hvc.profileCreated = YES;
    [self.navigationController pushViewController:hvc animated:YES];
}

@end
