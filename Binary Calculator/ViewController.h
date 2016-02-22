//
//  ViewController.h
//  Binary Calculator
//
//  Created by Marco Albera on 19/02/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextField *decimalField;
@property (weak) IBOutlet NSTextField *binaryField;

- (IBAction)onConvertClicked:(id)sender;

@end

