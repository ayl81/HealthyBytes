//
//  BloodPressurePickerView.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/24/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BloodPressurePickerView : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSString *bp;
}
@property (nonatomic, retain) NSString *bp;

@end
