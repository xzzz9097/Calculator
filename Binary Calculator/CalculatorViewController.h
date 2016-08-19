//
//  ViewController.h
//  Binary Calculator
//
//  Created by Marco Albera on 19/02/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <DDMathEvaluator.h>

@interface CalculatorViewController : NSViewController

@property (weak) IBOutlet NSTextField *inputField;
@property (weak) IBOutlet NSTextField *resultField;

- (void)compute;
- (NSString *)formatResult:(NSNumber *)rawResult withPrecision:(uint8_t)precision;
- (void)controlTextDidChange:(NSNotification *)obj;

@end

