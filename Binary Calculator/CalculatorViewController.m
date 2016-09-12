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
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    _parserFrontend = [ParserFrontend defaultParserFrontend];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)compute {
    // Parse expression
    if (_parserFrontend) {
        [_parserFrontend setInputString:[_inputField attributedStringValue]];
        
        NSString *_formattedResult = [_parserFrontend formattedResult];
        
        // Set string
        if (_formattedResult) {
            [_resultField setStringValue:_formattedResult];
        } else if ([[_inputField stringValue] length] == 0){
            [_resultField setStringValue:@""];
        } else {
            [_resultField setStringValue:@"..."];
        }
    }
}

- (void)formatInput {
    if ([_parserFrontend inputString]) {
        [_parserFrontend formatInput];
        [_inputField setAttributedStringValue:[_parserFrontend inputString]];
    }
}

@end
