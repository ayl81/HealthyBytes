//
//  CholesterolPickerView.h
//  HealthyBytes
//
//  Created by Alda Luong on 10/24/12.
//  Copyright (c) 2012 Alda Luong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CholesterolPickerView : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSString *cholesterol;
}
@property (nonatomic, retain) NSString *cholesterol;
@end
