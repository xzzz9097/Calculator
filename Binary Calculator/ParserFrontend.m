//
//  ParserFrontEnd.m
//  Binary Calculator
//
//  Created by Marco Albera on 19/08/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "ParserFrontend.h"

@implementation ParserFrontend

@synthesize inputString = _inputString;

- (id)initWithMathEvalator:(DDMathEvaluator *)mathEvaluator withInputValue:(NSString *)textInputValue {
    self = [super init];
    
    if (self) {
        _mathEvaluator = mathEvaluator;
        _inputString = textInputValue;
    }
    
    return self;
}

- (id)initWithMathEvaluator:(DDMathEvaluator *)mathEvaluator {
    return [self initWithMathEvalator:mathEvaluator withInputValue:nil];
}

- (NSNumber*)computeResultWithSubstitutions:(NSDictionary *)substitutions {
    return [_mathEvaluator evaluateString:_inputString withSubstitutions:substitutions];
}

- (NSNumber*)computeResult {
    return [self computeResultWithSubstitutions:nil];
}

@end
