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
    if ([self isTextFieldVoid]) {
        [self saveCurrentInputString];
    }

    [self compute];
    
    [self formatInput];
}

- (BOOL)control:(NSControl *)control textView:(NSTextView *)textView doCommandBySelector:(SEL)commandSelector {
    if (commandSelector == @selector(moveUp:)) {
        if ([self isTextFieldVoid] | [self isTextSelectedInEditor:textView]) {
            [self restoreLastInputString];
            [self compute];
        }
        return true;
    }

    return false;
}

@end
