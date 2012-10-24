//
//  WeightPickerView.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/23/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "WeightPickerView.h"

@implementation WeightPickerView
@synthesize weight;

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
        return @"lb";
    }
    return [NSString stringWithFormat:@"%d", row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	// If the user chooses a new row, update the label accordingly.
    NSInteger value = [pickerView selectedRowInComponent:2]+[pickerView selectedRowInComponent:1]*10 + [pickerView selectedRowInComponent:0]*100;
	self.weight = [NSString stringWithFormat:@"%d", value];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
