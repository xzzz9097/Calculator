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
    if (![self isTextFieldValid]) {
        return;
    }

    if ([self isTextFieldVoid]) {
        [self saveCurrentInputString];
    }

    [self compute];
    [self formatInput];
}

- (BOOL)control:(NSControl *)control textView:(NSTextView *)textView doCommandBySelector:(SEL)commandSelector {
    // History travel handling
    if (commandSelector == @selector(moveUp:)) {
        if ([self isTextFieldVoid] | [self isTextSelectedInEditor:textView]) {
            [self restoreLastInputString];

            [self compute];
            [self formatInput];

            [self setShouldResetHistory:false];
        }

        return true;
    }

    // Prevent pgDown (cmd+>) from going beyound the input
    if (commandSelector == @selector(moveToRightEndOfLine:)) {
        [self setCaretIndex:[self maxCaretIndex] onField:textView];

        return true;
    }

    // Same for > only
    if (commandSelector == @selector(moveRight:)) {
        NSUInteger caretPosition = [self getCaretIndexForField:textView];
        NSUInteger maxCaretPosition = [self maxCaretIndex];

        if (caretPosition >= maxCaretPosition) {
            if (caretPosition > maxCaretPosition) {
                [self setCaretIndex:maxCaretPosition onField:textView];
            }

            return true;
        }
    }

    return false;
}

@end
