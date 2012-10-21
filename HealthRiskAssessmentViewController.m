//
//  HealthRiskAssessmentViewController.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/19/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "HealthRiskAssessmentViewController.h"

@implementation HealthRiskAssessmentViewController

@synthesize healthRiskAssessmentQuestion;

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
    self.title = @"Health Risk Assessment";
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
            rows = 4;           // physical 
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
    //cell.textLabel.text = [self.colorNames objectAtIndex: [indexPath row]];
    
    // Configure the cell...
    NSString *cellText = nil;
    cell.detailTextLabel.text = nil;
    
    switch (indexPath.section) {
        case 0:
            cellText = [self.healthRiskAssessmentQuestion.physicalQuestions objectAtIndex:indexPath.row];  
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
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
