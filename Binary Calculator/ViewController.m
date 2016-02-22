//
//  ViewController.m
//  Binary Calculator
//
//  Created by Marco Albera on 19/02/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "ViewController.h"
#import "BinaryNumber.h"

@implementation ViewController

@synthesize decimalField;
@synthesize binaryField;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)onConvertClicked:(id)sender {
    NSInteger mDecimalNumber = [decimalField integerValue];
    
    BinaryNumber* mBinary = [[BinaryNumber alloc] initFromInteger:mDecimalNumber];
    
    [binaryField setStringValue:[mBinary getBinaryNumber]];
}

@end
