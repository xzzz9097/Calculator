//
//  TextFieldCell.m
//  Binary Calculator
//
//  Created by Marco Albera on 12/09/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "TextFieldCell.h"

@implementation TextFieldCell

- (NSTextView *)fieldEditorForView:(NSView *)aControlView {
    if (_fieldEditor == nil) {
        _fieldEditor = [[PlainPasteTextView alloc] init];
        [_fieldEditor setFieldEditor:true];
    }
    
    return [self fieldEditor];
}

@end
