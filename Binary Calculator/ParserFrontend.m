//
//  ParserFrontEnd.m
//  Binary Calculator
//
//  Created by Marco Albera on 19/08/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "ParserFrontend.h"

@implementation ParserFrontend {
    InputFormatter *_inputFormatter;
}

- (id)initWithInputValue:(NSAttributedString *)textInputValue {
    self = [super init];
    
    if (self) {
        _mathEvaluator = [DDMathEvaluator defaultMathEvaluator];
        _inputString = textInputValue;
        _inputFormatter = [[InputFormatter alloc] initWithRegisteredFunctions:[_mathEvaluator registeredFunctions]];
    }
    
    return self;
}

+ (instancetype)defaultParserFrontend {
    return [[self alloc] initWithInputValue:nil];
}

- (NSNumber*)computeResultWithSubstitutions:(NSDictionary *)substitutions {
    return [_mathEvaluator evaluateString:[_inputString string] withSubstitutions:substitutions];
}

- (NSNumber*)computeResult {
    return [self computeResultWithSubstitutions:nil];
}

- (void)formatInput {
    _inputString = [_inputFormatter formatInputString:_inputString];
}

@end
