//
//  ViewController.m
//  Binary Calculator
//
//  Created by Marco Albera on 19/02/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController {
    ParserFrontend *_parserFrontend;
    NSTextStorage *_inputTextStorage;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [self setTextViewFonts];

    _parserFrontend = [ParserFrontend defaultParserFrontend];
    _inputTextStorage = [_inputField textStorage];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)setTextViewFonts {
    [_inputField setFont:[NSFont systemFontOfSize:24 weight:NSFontWeightThin]];
    [_resultField setFont:[NSFont systemFontOfSize:24 weight:NSFontWeightLight]];
}

- (void)compute {
    // Parse expression
    if (_parserFrontend) {
        [_parserFrontend setInputString:[_inputField attributedString]];
        
        NSString *_formattedResult = [_parserFrontend formattedResult];
        
        // Set string
        if (_formattedResult) {
            [_resultField setString:_formattedResult];
        } else if ([[_inputTextStorage string] length] == 0){
            [_resultField setString:@""];
        } else {
            [_resultField setString:@"..."];
        }
    }
}

- (void)formatInput {
    if ([_parserFrontend inputString]) {
        [_parserFrontend formatInput];
        [_inputTextStorage setAttributedString:[_parserFrontend inputString]];
    }
}

- (void)textDidChange:(NSNotification *)obj {
    [self compute];

    [self formatInput];
}

@end
