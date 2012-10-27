//
//  HbA1cPickerView.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/27/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HbA1cPickerView : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSString *HbA1c;
}

@property (nonatomic, retain) NSString *HbA1c;
@end
