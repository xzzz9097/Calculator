//
//  ViewController.m
//  Binary Calculator
//
//  Created by Marco Albera on 19/02/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController

@synthesize inputField;
@synthesize resultField;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)compute {
    // Parse expression
    NSNumber *mResult = [[inputField stringValue] numberByEvaluatingString];
    
    // Set string
    if (mResult) {
        [resultField setStringValue:[self formatResult:mResult withPrecision:5]];
    } else {
        [resultField setStringValue:@"..."];
    }
}

- (NSString *)formatResult:(NSNumber *)rawResult withPrecision:(uint8_t)precision {
    NSNumberFormatter *mFormatter = [[NSNumberFormatter alloc] init];

    [mFormatter setMaximumFractionDigits:precision];

    return [mFormatter stringFromNumber:rawResult];
}

- (void)controlTextDidChange:(NSNotification *)obj {
    [self compute];
}

@end
