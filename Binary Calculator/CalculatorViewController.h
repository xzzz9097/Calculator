//
//  ViewController.h
//  Binary Calculator
//
//  Created by Marco Albera on 19/02/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ParserFrontend.h"

typedef enum ComputationStatus : NSUInteger {
    COMPUTATION_DONE,
    COMPUTATION_ERROR,
    COMPUTATION_VOID
} ComputationStatus;

@interface CalculatorViewController : NSViewController

@property (nonatomic) ComputationStatus computationStatus;

@property (weak) IBOutlet NSTextField *inputField;
@property (weak) IBOutlet NSTextField *resultField;
@property (weak) IBOutlet NSTextField *errorField;

- (void)compute;
- (void)formatInput;
- (void)prepareErrorField;
- (void)updateResultField;
- (void)updateErrorField;

@end

