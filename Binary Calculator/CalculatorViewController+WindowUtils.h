//
//  CalculatorViewController+WindowUtils.h
//  Mathematica
//
//  Created by Marco Albera on 22/09/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculatorViewController.h"

@interface CalculatorViewController (WindowUtils)

- (void)toggleView:(NSView *)myView visible:(BOOL)visible;
- (void)shiftWindowBy:(CGFloat)value down:(BOOL)down;

@end
