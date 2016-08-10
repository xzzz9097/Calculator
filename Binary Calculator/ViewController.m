//
//  ViewController.m
//  Binary Calculator
//
//  Created by Marco Albera on 19/02/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

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

- (IBAction)onComputeClicked:(id)sender {
    @try {
        // Parse expression
        NSExpression* mExpression = [NSExpression expressionWithFormat:[inputField stringValue]];

        // Set string
        [resultField setStringValue:[mExpression expressionValueWithObject:nil context:nil]];
    } @catch (NSException *exception) {
        // Print an error message
        [resultField setStringValue:@"Error"];
    }
}

@end
