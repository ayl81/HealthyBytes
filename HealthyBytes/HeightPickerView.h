//
//  HeightPickerView.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/23/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeightPickerView : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSString *height;
}
@property (nonatomic, retain) NSString *height;

@end
