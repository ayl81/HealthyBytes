//
//  YesNoPickerView.m
//  HealthyBytes
//
//  Created by Alda Luong on 10/24/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import "YesNoPickerView.h"

@implementation YesNoPickerView
@synthesize result;

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
    return 3;
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (row)
    {
        case 1:
            return @"No";
            break;
        case 2:
            return @"Yes";
            break;
    }
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	// If the user chooses a new row, update the label accordingly.
    self.result = @"";
    
    switch (row)
    {
        case 1:
            self.result = @"No";
            break;
        case 2:
            self.result = @"Yes";
            break;
    }
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
