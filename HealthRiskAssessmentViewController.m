//
//  HealthRiskAssessmentViewController.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/19/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "HealthRiskAssessmentViewController.h"

@implementation HealthRiskAssessmentViewController

@synthesize healthRiskAssessmentQuestion, actionSheet, pickerFrame, agePickerView, genderPickerView, heightPickerView, weightPickerView, age;

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
    //cell.textLabel.text = [self.colorNames objectAtIndex: [indexPath row]];
    
    // Configure the cell...
    NSString *cellText = nil;
    cell.detailTextLabel.text = nil;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    switch (indexPath.section) {
        case 0:
            cellText = [self.healthRiskAssessmentQuestion.physicalQuestions objectAtIndex:indexPath.row];
            if (indexPath.row == 0)
            {
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", self.age];
            }
            if (indexPath.row == 4)
            {
                cell.detailTextLabel.text = @"Answer yes if you have smoked any cigarettes in the past month.";
            }
            break;
        case 1:
            cellText = [self.healthRiskAssessmentQuestion.healthQuestions objectAtIndex:indexPath.row];
            if (indexPath.row == 0)
            {
                cell.detailTextLabel.text = @"Also known as Myocardial Infarction (MI).";
            }
            break;
        case 2:
            cellText = [self.healthRiskAssessmentQuestion.bloodPressureQuestions objectAtIndex:indexPath.row];
            break;
        case 3:
            cellText = [self.healthRiskAssessmentQuestion.cholesterolQuestions objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    /*
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:cell.contentView.frame] ;
    titleLabel.numberOfLines = 2;
    titleLabel.font = [UIFont boldSystemFontOfSize:12];
    titleLabel.text = @"testing";
    [cell.contentView addSubview:titleLabel];*/
    

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
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
    
    if ((indexPath.section) == 0) {
        switch (indexPath.row)
        {
            case 0:
            {
                self.agePickerView = [[AgePickerView alloc] initWithFrame:self.pickerFrame];
                self.agePickerView.showsSelectionIndicator = YES;
                self.agePickerView.dataSource = self.agePickerView;
                self.agePickerView.delegate = self.agePickerView;
                [self.actionSheet addSubview:self.agePickerView];
                [closeButton addTarget:self action:@selector(dismissAgeActionSheet:) forControlEvents:UIControlEventValueChanged];
            }
            break;
            case 1:
            {
                self.genderPickerView = [[GenderPickerView alloc] initWithFrame:self.pickerFrame];
                self.genderPickerView.showsSelectionIndicator = YES;
                self.genderPickerView.dataSource = self.genderPickerView;
                self.genderPickerView.delegate = self.genderPickerView;
                [self.actionSheet addSubview:self.genderPickerView];
                [closeButton addTarget:self action:@selector(dismissGenderActionSheet:) forControlEvents:UIControlEventValueChanged];
            }
            break;
            case 2:
            {
                self.heightPickerView = [[HeightPickerView alloc] initWithFrame:self.pickerFrame];
                self.heightPickerView.showsSelectionIndicator = YES;
                self.heightPickerView.dataSource = self.heightPickerView;
                self.heightPickerView.delegate = self.heightPickerView;
                [self.actionSheet addSubview:self.heightPickerView];
                [closeButton addTarget:self action:@selector(dismissHeightActionSheet:) forControlEvents:UIControlEventValueChanged];
            }
            break;
            case 3:
            {
                self.weightPickerView = [[WeightPickerView alloc] initWithFrame:self.pickerFrame];
                self.weightPickerView.showsSelectionIndicator = YES;
                self.weightPickerView.dataSource = self.weightPickerView;
                self.weightPickerView.delegate = self.weightPickerView;
                [self.actionSheet addSubview:self.weightPickerView];
                [closeButton addTarget:self action:@selector(dismissWeightActionSheet:) forControlEvents:UIControlEventValueChanged];
            }
            break;
            case 4:
            {
            }
            break;
        default:
            break;
        }
    }
    
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
    NSLog(@"Age: %d", self.agePickerView.age);
}

- (void)dismissGenderActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    gender = self.genderPickerView.gender;
    NSLog(@"Gender: %@", self.genderPickerView.gender);
}

- (void)dismissHeightActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    height = self.heightPickerView.height;
    NSLog(@"Height: %d", self.heightPickerView.height);
}

- (void)dismissWeightActionSheet:(id)sender
{
    if (self.actionSheet && [self.actionSheet isVisible])
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    self.actionSheet = nil;
    
    weight = self.weightPickerView.weight;
    NSLog(@"Weight: %d", self.weightPickerView.weight);
}
@end
