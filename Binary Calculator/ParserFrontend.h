//
//  ParserFrontEnd.h
//  Binary Calculator
//
//  Created by Marco Albera on 19/08/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DDMathEvaluator.h>
#import "InputFormatter.h"

@interface ParserFrontend : NSObject

@property (nonatomic) NSAttributedString *inputString;
@property (nonatomic) DDMathEvaluator *mathEvaluator;

- (id)initWithMathEvalator:(DDMathEvaluator *)mathEvaluator withInputValue:(NSMutableAttributedString *)textInputValue;
- (id)initWithMathEvaluator:(DDMathEvaluator *)mathEvaluator;
- (NSNumber*)computeResultWithSubstitutions:(NSDictionary*)substitutions;
- (NSNumber*)computeResult;
- (void)formatInput;

@end