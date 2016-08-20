//
//  ParserFrontEnd.h
//  Binary Calculator
//
//  Created by Marco Albera on 19/08/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DDMathEvaluator.h>

@interface ParserFrontend : NSObject {
    DDMathEvaluator *_mathEvaluator;
}

@property (nonatomic) NSString *inputString;

- (id)initWithMathEvalator:(DDMathEvaluator *)mathEvaluator withInputValue:(NSString *)textInputValue;
- (id)initWithMathEvaluator:(DDMathEvaluator *)mathEvaluator;
- (NSNumber*)computeResultWithSubstitutions:(NSDictionary*)substitutions;
- (NSNumber*)computeResult;

@end
