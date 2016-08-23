//
//  OutputFormatter.h
//  Binary Calculator
//
//  Created by Marco Albera on 23/08/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSUInteger MINIMUM_INTEGER_DIGITS;

@interface OutputFormatter : NSNumberFormatter

@property (nonatomic) uint8_t precision;

- (id)initWithPrecision:(uint8_t)precision;

@end
