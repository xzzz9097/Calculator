//
//  ViewController.h
//  Binary Calculator
//
//  Created by Marco Albera on 19/02/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ParserFrontend.h"

@interface CalculatorViewController : NSViewController

@property (unsafe_unretained) IBOutlet NSTextView *inputField;
@property (unsafe_unretained) IBOutlet NSTextView *resultField;

- (void)prepareTextViews;
- (void)compute;
- (void)formatInput;
- (void)textDidChange:(NSNotification *)obj;

@end

