//
//  GenderPickerView.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/22/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GenderPickerView : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSString *gender;
}

@property (nonatomic, retain) NSString *gender;

@end
