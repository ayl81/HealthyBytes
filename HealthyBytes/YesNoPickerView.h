//
//  YesNoPickerView.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/24/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YesNoPickerView : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSString *result;
}

@property (nonatomic, retain) NSString *result;
@end
