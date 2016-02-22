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

- (NSInteger) getDigit:(NSInteger) i {
    return [[binaryNumber objectAtIndex:i] integerValue];
}

- (NSUInteger) countIntegerDigits:(NSInteger)n {
    NSNumber* number = [[NSNumber alloc] initWithInteger:n];
    
    return [[number stringValue] length];
}

- (void) fromInteger:(NSInteger)n {
    integerNumber = n;
    
    NSUInteger digits = ceil(log2(integerNumber));
    NSUInteger i = digits;
    
    binaryNumber = [NSMutableArray arrayWithCapacity:digits];
    
    while (i > 0) {
        i--;
        
        NSInteger binaryDigit = integerNumber % 2;
        
        [binaryNumber insertObject:[NSNumber numberWithInteger:binaryDigit] atIndex:0];
        
        integerNumber /= 2;
    }
}

- (NSString*) getBinaryNumber {
    // We create a string from the array
    NSMutableString* numberString = [[NSMutableString alloc] initWithCapacity:[binaryNumber count]];
    
    for (NSNumber* digit in binaryNumber) {
        [numberString appendString:[digit stringValue]];
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
