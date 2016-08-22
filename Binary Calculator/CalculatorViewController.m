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
    _parserFrontend = [[ParserFrontend alloc] initWithMathEvaluator:[DDMathEvaluator defaultMathEvaluator]];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)compute {
    // Parse expression
    if (_parserFrontend) {
        [_parserFrontend setInputString:[_inputField attributedStringValue]];
        
        NSNumber *_result = [_parserFrontend computeResult];
        
        // Set string
        if (_result) {
            [_resultField setStringValue:[self formatResult:_result withPrecision:5]];
        } else if ([[_inputField stringValue] length] == 0){
            [_resultField setStringValue:@""];
        } else {
            [_resultField setStringValue:@"..."];
        }
    }
}

- (NSString *)formatResult:(NSNumber *)rawResult withPrecision:(uint8_t)precision {
    NSNumberFormatter *mFormatter = [[NSNumberFormatter alloc] init];

    [mFormatter setMinimumIntegerDigits:1];
    [mFormatter setMaximumFractionDigits:precision];

    return [mFormatter stringFromNumber:rawResult];
}

- (void)controlTextDidChange:(NSNotification *)obj {
    [self compute];

    [_parserFrontend formatInput];
    [_inputField setAttributedStringValue:[_parserFrontend inputString]];
}

@end
