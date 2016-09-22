//
//  CalculatorViewController+WindowUtils.m
//  Mathematica
//
//  Created by Marco Albera on 22/09/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "CalculatorViewController+WindowUtils.h"

@implementation CalculatorViewController (WindowUtils)

- (void)toggleView:(NSView *)myView visible:(BOOL)visible {
    NSRect viewFrame = [[self view] frame];
    BOOL currentlyShown = [myView isDescendantOf:[self view]];

    if (visible && !currentlyShown) {
        [[self view] addSubview:myView];
        viewFrame.size.height += [myView frame].size.height;
        [self shiftWindowBy:[myView frame].size.height down:true];
    } else if (!visible && currentlyShown) {
        [myView removeFromSuperview];
        viewFrame.size.height -= [myView frame].size.height;
        [self shiftWindowBy:[myView frame].size.height down:false];
    }

    [[self view] setFrame:viewFrame];

    [[[self view] window] setContentSize:viewFrame.size];
}

- (void)shiftWindowBy:(CGFloat)value down:(BOOL)down {
    NSRect windowFrame = [[[self view] window] frame];

    if (down) {
        [[[self view] window] setFrameOrigin:NSMakePoint(windowFrame.origin.x, windowFrame.origin.y - value)];
    } else {
        [[[self view] window] setFrameOrigin:NSMakePoint(windowFrame.origin.x, windowFrame.origin.y + value)];
    }
}

@end
