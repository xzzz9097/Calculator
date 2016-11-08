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
    OutputFormatter *_outputFormatter;

    NSString *_errorString;
}

- (id)initWithInputValue:(NSAttributedString *)textInputValue {
    self = [super init];
    
    if (self) {
        _mathEvaluator = [DDMathEvaluator defaultMathEvaluator];
        _inputString = textInputValue;
        _inputFormatter = [[InputFormatter alloc] initWithRegisteredFunctions:[_mathEvaluator registeredFunctions]];
        _outputFormatter = [[OutputFormatter alloc] initWithPrecision:5];
        _historyMaker = [HistoryMaker defaultHistoryMaker];
    }
    
    return self;
}

+ (instancetype)defaultParserFrontend {
    return [[self alloc] initWithInputValue:nil];
}

- (NSNumber *)computeResultWithSubstitutions:(NSDictionary *)substitutions {
    NSError *error = nil;

    NSNumber *result = [_mathEvaluator evaluateString:[_inputString string] withSubstitutions:substitutions error:&error];

    if (error) _errorString = [[error userInfo] valueForKey:DDMathParserFailureReasonKey];

    return result;
}

- (NSNumber *)computeResult {
    return [self computeResultWithSubstitutions:nil];
}

- (NSString *)formattedResultWithSubstitutions:(NSDictionary *)substitutions {
    return [_outputFormatter stringFromNumber:[self computeResultWithSubstitutions:substitutions]];
}

- (void)setInputString:(NSAttributedString *)inputString {
    NSString *selectedString = [[[inputString string] componentsSeparatedByString:@" = "]firstObject];

    NSRange selectedRange = [[inputString string] rangeOfString:selectedString];

    if (selectedRange.length) {
        _inputString = [inputString attributedSubstringFromRange:selectedRange];
    } else {
        _inputString = nil;
    }
}

- (NSString *)formattedResult {
    return [self formattedResultWithSubstitutions:nil];
}

- (NSAttributedString *)formattedInput {
    NSMutableAttributedString *finalResult = [[_inputFormatter attributedStringForObjectValue:_inputString withDefaultAttributes:nil] mutableCopy];

    if ([self formattedResult]) {
        NSString *formattedResult = [NSString stringWithFormat:@" = %@", [self formattedResult]];

        NSAttributedString *resultString = [[NSAttributedString alloc] initWithString:formattedResult attributes:nil];

        [finalResult appendAttributedString:resultString];
    }

    return finalResult;
}

- (NSString *)errorString {
    return [[_errorString stringByReplacingOccurrencesOfString:@":" withString:@" "] stringByReplacingOccurrencesOfString:@"  " withString:@", "];
}

- (void)saveCurrentInputString {
    if (_inputString) {
        [_historyMaker saveExpression:_inputString];
        [self resetHistoryRequest];
    }
}

- (void)restoreLastInputString {
    NSAttributedString *lastInputString = [_historyMaker previousSavedExpression];

    if (lastInputString) {
        _inputString = lastInputString;
    }
}

- (void)resetHistoryRequest {
    [_historyMaker resetRequest];
}

@end
