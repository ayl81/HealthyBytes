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
    NSString *age;
}

@property (nonatomic, retain) NSString *age;

@end
