//
//  HbA1cPickerView.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/27/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "HbA1cPickerView.h"

@implementation HbA1cPickerView

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
    if (component == 1)
    {
        return 1;
    }
    return 10; 
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 1)
            return @".";
    
    return [NSString stringWithFormat:@"%d", row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	self.HbA1c = [NSString stringWithFormat:@"%d.%d", [pickerView selectedRowInComponent:0],[pickerView selectedRowInComponent:2]];
}

@end
