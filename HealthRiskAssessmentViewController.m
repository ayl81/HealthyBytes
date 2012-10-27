//
//  HealthRiskAssessmentViewController.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/19/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "HealthRiskAssessmentViewController.h"

@implementation HealthRiskAssessmentViewController

@synthesize healthRiskAssessmentQuestion, actionSheet, pickerFrame, agePickerView, genderPickerView, heightPickerView, weightPickerView, smokePickerView, heartAttackPickerView, strokePickerView, diabetesPickerView, systolicPickerView, diastolicPickerView, totalCholesterolPickerView, hdlPickerView, ldlPickerView, age, gender, height, weight, smoke, heartAttack, stroke, diabetes, systolic, diastolic, totalCholesterol, hdl, ldl, smokeActionSheet, tap, smokeInfoButton, heartAttackInfoButton;

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
    [self.tableView reloadData];
    [self.tableView setContentOffset:CGPointZero animated:NO];
    
    // Capture taps outside the bounds of this alert view
	self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOut:)];
	self.tap.cancelsTouchesInView = NO; // So that legit taps on the table bubble up to the tableview
	[self.view addGestureRecognizer:self.tap];
    
    self.smokeInfoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    [self.smokeInfoButton setFrame:CGRectMake(145, 10, 13, 13)];
    [self.smokeInfoButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [self.smokeInfoButton addTarget:self action:@selector(smokeInfoButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.heartAttackInfoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    [self.heartAttackInfoButton setFrame:CGRectMake(125, 10, 13, 13)];
    [self.heartAttackInfoButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [self.heartAttackInfoButton addTarget:self action:@selector(heartAttackInfoButtonAction:) forControlEvents:UIControlEventTouchUpInside];
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
    return 4;
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
        case 2:
            rows = 2;           // blood pressure
            break;
        case 3:
            rows = 3;           // cholestrol
            break;
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
    
    UITableViewCell *cell;
    
    if ((indexPath.section == 0) && (indexPath.row == 4))
    {
        cell = [tableView dequeueReusableCellWithIdentifier:smokeInfoCellIdentifier];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:smokeInfoCellIdentifier];
        }
        [cell.contentView addSubview:self.smokeInfoButton];
    }
    else if ((indexPath.section == 1) && (indexPath.row == 0))
    {
        cell = [tableView dequeueReusableCellWithIdentifier:heartAttackInfoCellIdentifier];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:heartAttackInfoCellIdentifier];
        }
        [cell.contentView addSubview:self.heartAttackInfoButton];
    }
    else 
    {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
            //NSLog(@"height of cell: %f; width of cell: %f", cell.frame.size.height, cell.frame.size.width);
        }
    }

    // Configure the cell...
    NSString *cellText = nil;
    cell.detailTextLabel.text = nil;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    /*
    UIView *mview = cell.contentView;
    CGRect lFrame = CGRectMake(3, cell.frame.size.height/2, 75, 14);
    UILabel *label1;
    label1.adjustsFontSizeToFitWidth = YES;
    label1 = [[UILabel alloc] initWithFrame:lFrame];
    label1.textColor = [UIColor blackColor];
    label1.textAlignment = UITextAlignmentLeft;
    label1.text =  @"Answer yes if you have smoked any cigarettes in the past month.";
    label1.backgroundColor = [UIColor clearColor];
    label1.font = [UIFont systemFontOfSize:12.0];
    [mview addSubview:label1];
     */
    
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
                    cell.detailTextLabel.text = self.smoke;
                NSLog(@"creating button");
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
                if (self.heartAttack)   //@"Also known as Myocardial Infarction (MI).";
                    cell.detailTextLabel.text = self.heartAttack;
                break;
            case 1:
                if (self.stroke)
                    cell.detailTextLabel.text = self.stroke;
                break;
            case 2:
                if (self.diabetes)
                    cell.detailTextLabel.text = self.diabetes;
                break;
            default:
                break;
        }
        
    }

    if (indexPath.section == 2)
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
    
    
    if (indexPath.section == 3)
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
        case 2:
            title = @"Blood Pressure";
            break;
        case 3:
            title = @"Cholesterol";
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
            break;
        case 1:
            break;
        case 2:
            title = @"skip this section if you have not been screened in the last year";
            break;
        case 3:
            title = @"skip this section if you have not been screened in the last year";
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
    
    if (indexPath.section == 2)
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
    
    if (indexPath.section == 3)
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


// For detecting taps outside of the alert view
-(void)tapOut:(UIGestureRecognizer *)gestureRecognizer {
	CGPoint p = [gestureRecognizer locationInView:self.smokeActionSheet];
	if (p.y < 0) { // They tapped outside
		[self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
	}
}

/*
- (void)smokeInfoButtonAction:(id)sender
{
    self.smokeActionSheet = [[UIActionSheet alloc]  initWithTitle:nil
                                                    delegate:nil
                                           cancelButtonTitle:nil
                                      destructiveButtonTitle:nil
                                           otherButtonTitles:nil];
    
    [self.smokeActionSheet setActionSheetStyle:UIActionSheetStyleDefault];
    
    CGRect smokeInfoFrame = CGRectMake(0, 40, 0, 0);
    UILabel *smokeInfoLabel = [[UILabel alloc] initWithFrame:smokeInfoFrame];
    smokeInfoLabel.text = @"Answer yes if you have smoked within the last 6 months.";
    [self.smokeActionSheet addSubview:smokeInfoLabel];
    [self.smokeActionSheet showInView:[[UIApplication sharedApplication] keyWindow]];
    
    [self.smokeActionSheet setBounds:CGRectMake(0, 0, 320, 485)];
    
    CGPoint p = [self.tap locationInView:self.smokeActionSheet];
	if (p.y < 0) { // They tapped outside
		[self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
        self.smokeActionSheet = nil;
	}
    
    //if (self.smokeActionSheet && [self.smokeActionSheet isVisible])
      //  [self.smokeActionSheet dismissWithClickedButtonIndex:0 animated:YES];
    //self.smokeActionSheet = nil;
}
 */

- (void)smokeInfoButtonAction:(id)sender
{
    SmokeInfoViewController *smokeInfoViewController = [[SmokeInfoViewController alloc] init];
    [self.navigationController pushViewController:smokeInfoViewController animated:YES];
}

- (void)heartAttackInfoButtonAction:(id)sender
{
    SmokeInfoViewController *smokeInfoViewController = [[SmokeInfoViewController alloc] init];
    [self.navigationController pushViewController:smokeInfoViewController animated:YES];
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

- (void)dismissSystolicActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    self.systolic = self.systolicPickerView.bp;
    NSLog(@"Systolic: %@", self.systolicPickerView.bp);
    
    NSIndexPath *systolicIP = [NSIndexPath indexPathForRow:0 inSection:2];
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
    
    NSIndexPath *diastolicIP = [NSIndexPath indexPathForRow:1 inSection:2];
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
    
    NSIndexPath *totalIP = [NSIndexPath indexPathForRow:0 inSection:3];
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
    
    NSIndexPath *hdlIP = [NSIndexPath indexPathForRow:1 inSection:3];
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
    
    NSIndexPath *ldlIP = [NSIndexPath indexPathForRow:2 inSection:3];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:ldlIP, nil] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}
@end
