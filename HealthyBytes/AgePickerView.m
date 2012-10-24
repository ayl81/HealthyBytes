//
//  AgePickerView.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/22/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "AgePickerView.h"

@implementation AgePickerView

@synthesize age;

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
    return 68;
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%d", (18 + row)];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	// If the user chooses a new row, update the label accordingly.
	self.age = [NSString stringWithFormat:@"%d", ([pickerView selectedRowInComponent:0] + 18)];
}

@end
