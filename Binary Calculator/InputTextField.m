//
//  InputTextView.m
//  Binary Calculator
//
//  Created by Marco Albera on 24/08/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "InputTextField.h"

@implementation InputTextField

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

/* Override method in order to paste plain text */
- (NSArray *)readablePasteboardTypes {
    return [NSArray arrayWithObjects:NSPasteboardTypeString, nil];
}

@end
