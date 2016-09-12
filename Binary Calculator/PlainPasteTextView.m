//
//  PlainPasteTextView.m
//  Binary Calculator
//
//  Created by Marco Albera on 12/09/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "PlainPasteTextView.h"

@implementation PlainPasteTextView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)paste:(id)sender {
    [self pasteAsPlainText:sender];
}

@end
