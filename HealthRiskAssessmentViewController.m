//
//  HealthRiskAssessmentViewController.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/19/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "HealthRiskAssessmentViewController.h"
//#import "HomeViewController.h"

@implementation HealthRiskAssessmentViewController

@synthesize healthRiskAssessmentQuestion, actionSheet, pickerFrame, agePickerView, genderPickerView, heightPickerView, weightPickerView, smokePickerView, heartAttackPickerView, strokePickerView, diabetesPickerView, age, gender, height, weight, smoke, heartAttack, stroke, diabetes, smokeActionSheet, smokeLabel, heartAttackLabel,diabetesLabel;

// riskResultsViewController, systolicPickerView, diastolicPickerView, totalCholesterolPickerView, hdlPickerView, ldlPickerView, hbA1cPickerView, systolic, diastolic, totalCholesterol, hdl, ldl, HbA1c,

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //initialize default values
        self.smoke = @"No";
        self.heartAttack = @"No";
        self.stroke = @"No";
        self.diabetes = @"No";
        
        // add home button
/*        UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(goHome)];
        self.navigationItem.rightBarButtonItem = anotherButton;
 */
    }
    NSLog(@"nib name: %@", nibNameOrNil);
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
    
    [self.tableView reloadData];
    [self.tableView setContentOffset:CGPointZero animated:NO];
    
    CGRect labelFrame = CGRectMake(210, -10, 60, 60);
    
    self.smokeLabel = [[UILabel alloc] initWithFrame:labelFrame];
    self.smokeLabel.textColor = [UIColor blueColor];
    self.smokeLabel.textAlignment = UITextAlignmentRight;
    self.smokeLabel.font = [UIFont systemFontOfSize:17.0];
    self.smokeLabel.adjustsFontSizeToFitWidth = YES;
    self.smokeLabel.backgroundColor = [UIColor clearColor];
    
    self.heartAttackLabel = [[UILabel alloc] initWithFrame:labelFrame];
    self.heartAttackLabel.textColor = [UIColor blackColor];
    self.heartAttackLabel.textAlignment = UITextAlignmentRight;
    self.heartAttackLabel.font = [UIFont systemFontOfSize:17.0];
    self.heartAttackLabel.adjustsFontSizeToFitWidth = YES;
    self.heartAttackLabel.backgroundColor = [UIColor clearColor];
    
    self.diabetesLabel = [[UILabel alloc] initWithFrame:labelFrame];
    self.diabetesLabel.textAlignment = UITextAlignmentRight;
    self.diabetesLabel.font = [UIFont systemFontOfSize:17.0];
    self.diabetesLabel.adjustsFontSizeToFitWidth = YES;
    self.diabetesLabel.backgroundColor = [UIColor clearColor];
    
    
    // create the "Next" button
    UIButton *calculateRisk = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    calculateRisk.frame = CGRectMake(0, 20, 280, 40);
    [calculateRisk setTitle:@"Next" forState:UIControlStateNormal];
    calculateRisk.backgroundColor = [UIColor clearColor];
    [calculateRisk setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [calculateRisk addTarget:self action:@selector(nextHealthRiskAssessmentPage) forControlEvents:UIControlEventTouchUpInside];
    calculateRisk.tintColor = [UIColor blueColor];
    
    //create a footer view on the bottom of the tabeview
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, 280, 100)];
    [footerView addSubview:calculateRisk];
    
    self.tableView.tableFooterView = footerView;
    
    self.navigationItem.title = @"Assessment";
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
    //return 5;
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	/*
	 The number of rows varies by section.
	 */
    NSInteger rows = 0;
    switch (section) {
        case 0:
            rows = 5;           // physical
            break;
        case 1:
            rows = 3;           // health 
            break;
        /*case 2:
            rows = 1;           // diabetes
            break;
        case 3:
            rows = 2;           // blood pressure
            break;
        case 4:
            rows = 3;           // cholestrol
            break;*/
        default:
            break;
    }
    //return [self.colorNames count];
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    static NSString *smokeInfoCellIdentifier = @"SmokeInfoCell";
    static NSString *heartAttackInfoCellIdentifier = @"HeartAttackInfoCell";
    static NSString *diabetesAttackInfoCellIdentifier = @"DiabetesInfoCell";
    
    UITableViewCell *cell;
    
    if ((indexPath.section == 0) && (indexPath.row == 4))
    {
        cell = [tableView dequeueReusableCellWithIdentifier:smokeInfoCellIdentifier];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:smokeInfoCellIdentifier];
        }
        [cell.contentView addSubview:self.smokeLabel];
    }
    else if ((indexPath.section == 1) && (indexPath.row == 0))
    {
        cell = [tableView dequeueReusableCellWithIdentifier:heartAttackInfoCellIdentifier];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:heartAttackInfoCellIdentifier];
        }
        [cell.contentView addSubview:self.heartAttackLabel];
    }
    else if ((indexPath.section == 1) && (indexPath.row == 2))
    {
        cell = [tableView dequeueReusableCellWithIdentifier:diabetesAttackInfoCellIdentifier];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:diabetesAttackInfoCellIdentifier];
        }
        [cell.contentView addSubview:self.diabetesLabel];
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
            //NSLog(@"height of cell: %f; width of cell: %f", cell.frame.size.height, cell.frame.size.width);
            colorOfInfoCells = cell.detailTextLabel.textColor;
            //NSLog (@"cell text color %@", cell.detailTextLabel.textColor);
        }
    }

    // Configure the cell...
    NSString *cellText = nil;
    cell.detailTextLabel.text = nil;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0)
    {
        cellText = [self.healthRiskAssessmentQuestion.physicalQuestions objectAtIndex:indexPath.row];
        switch (indexPath.row)
        {
            case 0:
                if (self.age)
                    cell.detailTextLabel.text = self.age;
                break;
            case 1:
                if (self.gender)
                    cell.detailTextLabel.text = self.gender;
                break;
            case 2:
                if (self.height)
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ in", self.height];
                break;
            case 3:
                if (self.weight)
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ lbs", self.weight];
                break;
            case 4:
                if (self.smoke)
                    self.smokeLabel.text = self.smoke;
                self.smokeLabel.textColor = colorOfInfoCells;
                cell.detailTextLabel.font = [UIFont systemFontOfSize:11];
                cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
                cell.detailTextLabel.text = @"Within the past month.";
                break;
            default:
                break;
                
        }
    }
    
    if (indexPath.section == 1)
    {
        cellText = [self.healthRiskAssessmentQuestion.healthQuestions objectAtIndex:indexPath.row];

        switch (indexPath.row)
        {
            case 0:
                if (self.heartAttack)
                    self.heartAttackLabel.text = self.heartAttack;
                self.heartAttackLabel.textColor = colorOfInfoCells;
                cell.detailTextLabel.font = [UIFont systemFontOfSize:11];
                cell.detailTextLabel.text = @"Also called a myocardial infarction or MI.";
                break;
            case 1:
                if (self.stroke)
                    cell.detailTextLabel.text = self.stroke;
                break;
            case 2:
                if (self.diabetes)
                    self.diabetesLabel.text = self.diabetes;
                self.diabetesLabel.textColor = colorOfInfoCells;
                cell.detailTextLabel.font = [UIFont systemFontOfSize:11];
                cell.detailTextLabel.text = @"Diabetes mellitus type I or type II.";
                break;
            default:
                break;
        }
        
    }
    
/*    if (indexPath.section == 2)
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

    if (indexPath.section == 3)
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
    
    
    if (indexPath.section == 4)
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
*/
    cell.textLabel.text = cellText;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *title = nil;
    switch (section) {
        case 0:
            break;
        case 1:
            title = @"Has a doctor ever told you that you had a:";
            break;
        /*case 2:
            title = @"Diabetes";
            break;
        case 3:
            title = @"Blood Pressure";
            break;
        case 4:
            title = @"Cholesterol";
            break;*/
        default:
            break;
    }
    return title;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    NSString *title = nil;
    switch (section) {
        case 0:
            break;
        case 1:
            break;
        /*case 2:
            title = @"skip this section if you do not have diabetes";
            break;
        case 3:
            title = @"skip this section if you have not been screened in the last year";
            break;
        case 4:
            title = @"skip this section if you have not been screened in the last year";
            break;*/
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
    
    if (indexPath.section == 0)
    {
        switch (indexPath.row)
        {
            case 0:
                self.agePickerView = [[AgePickerView alloc] initWithFrame:self.pickerFrame];
                self.agePickerView.showsSelectionIndicator = YES;
                self.agePickerView.dataSource = self.agePickerView;
                self.agePickerView.delegate = self.agePickerView;
                [self.actionSheet addSubview:self.agePickerView];
                [closeButton addTarget:self action:@selector(dismissAgeActionSheet:) forControlEvents:UIControlEventValueChanged];
                break;
            case 1:
                self.genderPickerView = [[GenderPickerView alloc] initWithFrame:self.pickerFrame];
                self.genderPickerView.showsSelectionIndicator = YES;
                self.genderPickerView.dataSource = self.genderPickerView;
                self.genderPickerView.delegate = self.genderPickerView;
                [self.actionSheet addSubview:self.genderPickerView];
                [closeButton addTarget:self action:@selector(dismissGenderActionSheet:) forControlEvents:UIControlEventValueChanged];
                break;
            case 2:
                self.heightPickerView = [[HeightPickerView alloc] initWithFrame:self.pickerFrame];
                self.heightPickerView.showsSelectionIndicator = YES;
                self.heightPickerView.dataSource = self.heightPickerView;
                self.heightPickerView.delegate = self.heightPickerView;
                [self.actionSheet addSubview:self.heightPickerView];
                [closeButton addTarget:self action:@selector(dismissHeightActionSheet:) forControlEvents:UIControlEventValueChanged];
                break;
            case 3:
                self.weightPickerView = [[WeightPickerView alloc] initWithFrame:self.pickerFrame];
                self.weightPickerView.showsSelectionIndicator = YES;
                self.weightPickerView.dataSource = self.weightPickerView;
                self.weightPickerView.delegate = self.weightPickerView;
                [self.actionSheet addSubview:self.weightPickerView];
                [closeButton addTarget:self action:@selector(dismissWeightActionSheet:) forControlEvents:UIControlEventValueChanged];
                break;
            case 4:
                self.smokePickerView = [[YesNoPickerView alloc] initWithFrame:self.pickerFrame];
                self.smokePickerView.showsSelectionIndicator = YES;
                self.smokePickerView.dataSource = self.smokePickerView;
                self.smokePickerView.delegate = self.smokePickerView;
                [self.actionSheet addSubview:self.smokePickerView];
                [closeButton addTarget:self action:@selector(dismissSmokeActionSheet:) forControlEvents:UIControlEventValueChanged];
                break;
            default:
                break;
        }
    }

    if (indexPath.section == 1)
    {
        switch (indexPath.row)
        {
            case 0:
                self.heartAttackPickerView = [[YesNoPickerView alloc] initWithFrame:self.pickerFrame];
                self.heartAttackPickerView.showsSelectionIndicator = YES;
                self.heartAttackPickerView.dataSource = self.heartAttackPickerView;
                self.heartAttackPickerView.delegate = self.heartAttackPickerView;
                [self.actionSheet addSubview:self.heartAttackPickerView];
                [closeButton addTarget:self action:@selector(dismissHeartAttackActionSheet:) forControlEvents:UIControlEventValueChanged];
                break;
            case 1:
                self.strokePickerView = [[YesNoPickerView alloc] initWithFrame:self.pickerFrame];
                self.strokePickerView.showsSelectionIndicator = YES;
                self.strokePickerView.dataSource = self.strokePickerView;
                self.strokePickerView.delegate = self.strokePickerView;
                [self.actionSheet addSubview:self.strokePickerView];
                [closeButton addTarget:self action:@selector(dismissStrokeActionSheet:) forControlEvents:UIControlEventValueChanged];
                break;
            case 2:
                self.diabetesPickerView = [[YesNoPickerView alloc] initWithFrame:self.pickerFrame];
                self.diabetesPickerView.showsSelectionIndicator = YES;
                self.diabetesPickerView.dataSource = self.diabetesPickerView;
                self.diabetesPickerView.delegate = self.diabetesPickerView;
                [self.actionSheet addSubview:self.diabetesPickerView];
                [closeButton addTarget:self action:@selector(dismissDiabetesActionSheet:) forControlEvents:UIControlEventValueChanged];
                break;
            default:
                break;
        }
    }
    /*    
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
    
    if (indexPath.section == 3)
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
    
    if (indexPath.section == 4)
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
    }*/
    [actionSheet addSubview:closeButton];
    [self.actionSheet showInView:[[UIApplication sharedApplication] keyWindow]];
    
    [self.actionSheet setBounds:CGRectMake(0, 0, 320, 485)];
}

- (void)dismissAgeActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    self.age = self.agePickerView.age;
    NSLog(@"Age: %@", self.agePickerView.age);
    
    NSIndexPath *ageIP = [NSIndexPath indexPathForRow:0 inSection:0];    
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:ageIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (void)dismissGenderActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    self.gender = self.genderPickerView.gender;
    NSLog(@"Gender: %@", self.genderPickerView.gender);
    
    NSIndexPath *genderIP = [NSIndexPath indexPathForRow:1 inSection:0];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:genderIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (void)dismissHeightActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    self.height = self.heightPickerView.height;
    NSLog(@"Height: %@", self.heightPickerView.height);

    NSIndexPath *heightIP = [NSIndexPath indexPathForRow:2 inSection:0];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:heightIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
    
}

- (void)dismissWeightActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    self.weight = self.weightPickerView.weight;
    NSLog(@"Weight: %@", self.weightPickerView.weight);
    
    NSIndexPath *weightIP = [NSIndexPath indexPathForRow:3 inSection:0];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:weightIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];

}

- (void)dismissSmokeActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    self.smoke = self.smokePickerView.result;
    NSLog(@"Smoke: %@", self.smokePickerView.result);
    
    NSIndexPath *smokeIP = [NSIndexPath indexPathForRow:4 inSection:0];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:smokeIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}


- (void)dismissHeartAttackActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    self.heartAttack = self.heartAttackPickerView.result;
    NSLog(@"Heart Attack: %@", self.heartAttackPickerView.result);
    
    NSIndexPath *diabetesIP = [NSIndexPath indexPathForRow:0 inSection:1];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:diabetesIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (void)dismissStrokeActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    self.stroke = self.strokePickerView.result;
    NSLog(@"Heart Attack: %@", self.strokePickerView.result);
    
    NSIndexPath *strokeIP = [NSIndexPath indexPathForRow:1 inSection:1];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:strokeIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (void)dismissDiabetesActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    self.diabetes = self.diabetesPickerView.result;
    NSLog(@"Diabetes: %@", self.diabetesPickerView.result);
    
    NSIndexPath *diabetesIP = [NSIndexPath indexPathForRow:2 inSection:1];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:diabetesIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}
/*
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
    
    NSIndexPath *systolicIP = [NSIndexPath indexPathForRow:0 inSection:3];
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
    
    NSIndexPath *diastolicIP = [NSIndexPath indexPathForRow:1 inSection:3];
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
    
    NSIndexPath *totalIP = [NSIndexPath indexPathForRow:0 inSection:4];
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
    
    NSIndexPath *hdlIP = [NSIndexPath indexPathForRow:1 inSection:4];
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
    
    NSIndexPath *ldlIP = [NSIndexPath indexPathForRow:2 inSection:4];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:ldlIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}
 */
/*
- (IBAction)calculateRiskButtonAction:(id)sender
{
    [self queryRisks];
    self.riskResultsViewController = [[RiskResultsViewController alloc] initWithNibName:@"RiskResultsViewController" bundle:nil];
    [self.navigationController pushViewController:riskResultsViewController animated:YES];
        
}

- (void)queryRisks
{    
    NSLog(@"age: %@", self.heartAttack);
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
*/

-(void)nextHealthRiskAssessmentPage
{
    HealthRiskAssessmentViewController2 *hravc2 = [[HealthRiskAssessmentViewController2 alloc] initWithNibName:@"HealthRiskAssessmentViewController2" bundle:nil];
    hravc2.healthRiskAssessmentQuestion = [[HealthRiskAssessmentQuestions alloc] init];
    hravc2.age = self.age;
    hravc2.gender = self.gender;
    hravc2.height = self.height;
    hravc2.weight = self.weight;
    hravc2.smoke = self.smoke;
    
    [self.navigationController pushViewController:hravc2 animated:YES];
}
@end
