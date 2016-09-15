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
    NSString *_formattedResult;
    NSView *_backgroundView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    _parserFrontend = [ParserFrontend defaultParserFrontend];

    [self setComputationStatus:COMPUTATION_VOID];

    [self prepareErrorField];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)compute {
    // Parse expression
    if (_parserFrontend) {
        [_parserFrontend setInputString:[_inputField attributedStringValue]];
        
        _formattedResult = [_parserFrontend formattedResult];
        
        // Set string
        if (_formattedResult) {
            [self setComputationStatus:COMPUTATION_DONE];
            NSLog(@"HERE");
        } else if ([[_inputField stringValue] length] == 0) {
            [self setComputationStatus:COMPUTATION_VOID];
        } else {
            [self setComputationStatus:COMPUTATION_ERROR];
        }

        [self updateResultField];
        [self updateErrorField];
    }
}

- (void)formatInput {
    if ([_parserFrontend inputString]) {
        [_parserFrontend formatInput];
        [_inputField setAttributedStringValue:[_parserFrontend inputString]];
    }
}

- (void)prepareErrorField {
    _backgroundView = [_errorField superview];

    [_backgroundView setWantsLayer:true];

    [self updateErrorField];
}

- (void)updateResultField {
    switch (_computationStatus) {
        case COMPUTATION_DONE:
            [_resultField setStringValue:_formattedResult];
            break;
        case COMPUTATION_VOID:
            [_resultField setStringValue:@""];
            break;
        case COMPUTATION_ERROR:
            [_resultField setStringValue:@"..."];
            break;
        default:
            break;
    }
}

- (void)updateErrorField {
    switch (_computationStatus) {
        case COMPUTATION_ERROR:
            [[_backgroundView layer] setBackgroundColor:[[NSColor redColor] CGColor]];
            [_errorField setStringValue:@"Error"];
            break;
        default:
            [[_backgroundView layer] setBackgroundColor:[[NSColor greenColor] CGColor]];
            [_errorField setStringValue:@"Ready"];
            break;
    }
}

@end
