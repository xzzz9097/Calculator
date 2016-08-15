//
//  ViewController.h
//  Binary Calculator
//
//  Created by Marco Albera on 19/02/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <DDMathParser.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextField *inputField;
@property (weak) IBOutlet NSTextField *resultField;

- (void)compute;
- (void)controlTextDidChange:(NSNotification *)obj;

@end

