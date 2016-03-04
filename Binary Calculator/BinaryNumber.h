//
//  BinaryNumber.h
//  Binary Calculator
//
//  Created by Marco Albera on 19/02/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryNumber : NSObject

// Properties declarations
@property(nonatomic, readwrite) NSInteger integerNumber;
@property(nonatomic, readwrite) NSMutableArray *binaryNumber;
@property(nonatomic, readwrite) NSInteger binaryDigits;

// Methods declarations
- (void) fromInteger:(NSInteger)n;
- (void) fromDouble:(double)n;
- (NSString*) getBinaryNumber;
- (id) initFromInteger:(NSInteger)n;
- (id) initFromDouble:(double)n;
- (void) sum:(BinaryNumber*)b;

@end
