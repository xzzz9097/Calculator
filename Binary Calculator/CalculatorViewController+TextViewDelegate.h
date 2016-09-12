//
//  CalculatorViewController+TextViewDelegate.h
//  Binary Calculator
//
//  Created by Marco Albera on 12/09/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CalculatorViewController.h"

@interface CalculatorViewController (TextViewDelegate)

- (void)textDidChange:(NSNotification *)obj;

@end
