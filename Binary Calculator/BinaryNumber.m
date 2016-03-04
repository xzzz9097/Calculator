//
//  BinaryNumber.m
//  Binary Calculator
//
//  Created by Marco Albera on 19/02/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "BinaryNumber.h"

@implementation BinaryNumber

@synthesize integerNumber;
@synthesize binaryNumber;
@synthesize binaryDigits;

- (void) fromInteger:(NSInteger)n {
    integerNumber = n;
    
    // Gather binary digits by rounding down log2 of n and adding 1
    // e.g. -> log2(4) + 1 = 2 + 1 -> 3 digits
    NSUInteger absoluteIntegerNumber = labs(integerNumber);
    binaryDigits = floor(log2(absoluteIntegerNumber)) + 1;
    NSUInteger i = binaryDigits;
    
    binaryNumber = [NSMutableArray arrayWithCapacity:binaryDigits];
    
    while (i > 0) {
        i--;
        
        NSInteger binaryDigit = absoluteIntegerNumber % 2;
        
        [binaryNumber insertObject:[NSNumber numberWithInteger:binaryDigit] atIndex:0];
        
        absoluteIntegerNumber /= 2;
    }
}

- (NSString*) getBinaryNumber {
    // We create a string from the array
    NSMutableString* numberString = [[NSMutableString alloc] initWithCapacity:[binaryNumber count]];
    
    for (NSNumber* digit in binaryNumber) {
        [numberString appendString:[digit stringValue]];
    }
    
    // Add minus if negative
    if (integerNumber < 0) {
        [numberString insertString:@"-" atIndex:0];
    }
    
    return numberString;
}

- (id) initFromInteger:(NSInteger)n {
    self = [super init];
    
    if (self) {
        [self fromInteger:n];
    }
    
    return self;
}

- (void) sum:(BinaryNumber *)b {
    
}

@end
