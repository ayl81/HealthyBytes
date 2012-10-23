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
    NSInteger height;
}
@property (nonatomic) NSInteger height;

@end
