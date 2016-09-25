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
#import "OutputFormatter.h"
#import "HistoryMaker.h"

@interface ParserFrontend : NSObject

@property (nonatomic) NSAttributedString *inputString;
@property (nonatomic) DDMathEvaluator *mathEvaluator;
@property (nonatomic) HistoryMaker *historyMaker;

- (id)initWithInputValue:(NSMutableAttributedString *)textInputValue;
+ (instancetype)defaultParserFrontend;
- (NSNumber *)computeResultWithSubstitutions:(NSDictionary *)substitutions;
- (NSNumber *)computeResult;
- (NSString *)formattedResultWithSubstitutions:(NSDictionary *)substitutions;
- (NSString *)formattedResult;
- (void)formatInput;
- (NSString *)errorString;
- (void)saveCurrentInputString;
- (void)restoreLastInputString;
- (void)resetHistoryRequest;

@end
