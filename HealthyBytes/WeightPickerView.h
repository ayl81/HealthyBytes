//
//  WeightPickerView.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/23/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeightPickerView : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSString *weight;
}
@property (nonatomic, retain) NSString *weight;

@end
