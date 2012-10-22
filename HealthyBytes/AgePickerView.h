//
//  AgePickerView.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/22/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgePickerView : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSInteger age;
}

@property (nonatomic) NSInteger age;

@end
