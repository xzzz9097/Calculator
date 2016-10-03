//
//  ViewController.m
//  Binary Calculator
//
//  Created by Marco Albera on 19/02/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorViewController+WindowUtils.h"

@implementation CalculatorViewController {
    ParserFrontend *_parserFrontend;

    NSString *_formattedResult;
    NSView *_backgroundView;
    NSView *_completionBackgroundView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    _parserFrontend = [ParserFrontend defaultParserFrontend];

    [self setComputationStatus:COMPUTATION_VOID];
    [self setShouldResetHistory:false];

    [self prepareErrorField];
    [self prepareCompletionTableView];
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
        } else if ([self isTextFieldVoid]) {
            [self setComputationStatus:COMPUTATION_VOID];
        } else {
            [self setComputationStatus:COMPUTATION_ERROR];
        }

        if (_shouldResetHistory) {
            [_parserFrontend resetHistoryRequest];
            _shouldResetHistory = false;
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

- (void)prepareCompletionTableView {
    _completionBackgroundView = [[[_completionTableView superview] superview] superview];

    [self toggleView:_completionBackgroundView visible:false];
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
            [_errorField setStringValue:[_parserFrontend errorString]];
            [self toggleView:_backgroundView visible:true];
            break;
        default:
            [[_backgroundView layer] setBackgroundColor:[[NSColor greenColor] CGColor]];
            [_errorField setStringValue:@"Ready"];
            [self toggleView:_backgroundView visible:false];
            break;
    }
}

- (BOOL)isTextFieldVoid {
    return [[_inputField stringValue] length] == 0;
}

- (BOOL)isTextSelectedInEditor:(NSTextView *)textView {
    return ([textView selectedRange].length > 0);
}

- (void)saveCurrentInputString {
    switch (_computationStatus) {
        case COMPUTATION_DONE:
            [_parserFrontend saveCurrentInputString];
            break;
        case COMPUTATION_ERROR:
            _shouldResetHistory = true;
            break;
        default:
            break;
    }
}

- (void)restoreLastInputString {
    [_parserFrontend restoreLastInputString];

    [_inputField setAttributedStringValue:[_parserFrontend inputString]];
}

@end
