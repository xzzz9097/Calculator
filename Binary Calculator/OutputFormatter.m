//
//  OutputFormatter.m
//  Binary Calculator
//
//  Created by Marco Albera on 23/08/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "OutputFormatter.h"

const NSUInteger MINIMUM_INTEGER_DIGITS = 1;

@implementation OutputFormatter

- (id)initWithPrecision:(uint8_t)precision {
    self = [super init];

    if (self) {
        [self setMinimumIntegerDigits:MINIMUM_INTEGER_DIGITS];
        [self setMaximumFractionDigits:precision];
    }

    return self;
}

@end
