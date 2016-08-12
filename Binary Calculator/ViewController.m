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
    [self compute];
}

- (void)compute {
    @try {
        // Parse expression
        NSNumber *mResult = [[inputField stringValue] numberByEvaluatingString];

        // Set string
        [resultField setStringValue:[mResult stringValue]];
    } @catch (NSException *exception) {
        // Print an error message
        [resultField setStringValue:@"..."];
    }
}

- (void)controlTextDidChange:(NSNotification *)obj {
    [self compute];
}

@end
