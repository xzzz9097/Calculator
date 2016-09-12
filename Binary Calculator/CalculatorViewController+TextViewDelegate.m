//
//  CalculatorViewController+TextViewDelegate.m
//  Binary Calculator
//
//  Created by Marco Albera on 12/09/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "CalculatorViewController+TextViewDelegate.h"

@implementation CalculatorViewController (TextViewDelegate)

- (void)controlTextDidChange:(NSNotification *)obj {
    [self compute];
    
    [self formatInput];
}

@end
