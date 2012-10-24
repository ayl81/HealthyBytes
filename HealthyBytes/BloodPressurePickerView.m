//
//  BloodPressurePickerView.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/24/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "BloodPressurePickerView.h"

@implementation BloodPressurePickerView
@synthesize bp;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 3)
    {
        return 1;
    }
    return 10;
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 4;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 3)
    {
        return @"mmHg";
    }
    return [NSString stringWithFormat:@"%d", row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	// If the user chooses a new row, update the label accordingly.
    NSInteger value = [pickerView selectedRowInComponent:2]+[pickerView selectedRowInComponent:1]*10 + [pickerView selectedRowInComponent:0]*100;
	self.bp = [NSString stringWithFormat:@"%d", value];
}

@end
