//
//  InputFormatter.m
//  Binary Calculator
//
//  Created by Marco Albera on 20/08/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "InputFormatter.h"

@implementation InputFormatter

- (id)initWithRegisteredFunctions:(NSArray *)registeredFunctions {
    self = [super init];

    if (self) {
        _registeredFunctions = [self buildRegularExpressionWithFunctionsArray:registeredFunctions];
    }

    return self;
}

- (NSMutableAttributedString *)formatInputString:(NSAttributedString *)inputString {
    NSMutableAttributedString *formattedString = [inputString mutableCopy];
    __block NSRange range = NSMakeRange(0, [inputString length]);

    [self saveOriginalStyle:inputString];
    [self restoreOriginalStyle:formattedString range:range];

    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:_registeredFunctions options:kNilOptions error:nil];

    [regex enumerateMatchesInString:[inputString string] options:kNilOptions range:range usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        range = [result rangeAtIndex:1];

        [self applyItalicStyle:formattedString range:range];
    }];

    return formattedString;
}

- (void)applyItalicStyle:(NSMutableAttributedString *)formattedString range:(NSRange)range {
    [formattedString applyFontTraits:NSItalicFontMask range:range];
}

- (void)saveOriginalStyle:(NSAttributedString *)originalString {
    if (!_originalStringAttributes && [originalString length] > 0) {
        NSRange effectiveRange = NSMakeRange(0, 0);

        _originalStringAttributes = [originalString attributesAtIndex:NSMaxRange(effectiveRange) effectiveRange:&effectiveRange];
    }
}

- (void)restoreOriginalStyle:(NSMutableAttributedString *)formattedString range:(NSRange)range {
    if (_originalStringAttributes) {
        [formattedString setAttributes:_originalStringAttributes range:range];
    }
}

- (NSString *)buildRegularExpressionWithFunctionsArray:(NSArray *)functionsArray {
    NSString *regularExpression = @"";

    regularExpression = [regularExpression stringByAppendingString:@"("];

    for (NSString *functionName in functionsArray) {
        regularExpression = [regularExpression stringByAppendingString:functionName];
        regularExpression = [regularExpression stringByAppendingString:@"|"];
    }

    regularExpression = [regularExpression substringToIndex:[regularExpression length] - 1];
    regularExpression = [regularExpression stringByAppendingString:@")"];

    return regularExpression;
}

@end
