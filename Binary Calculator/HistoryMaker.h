//
//  HistoryMaker.h
//  Mathematica
//
//  Created by Marco Albera on 21/09/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryMaker : NSObject

+ (instancetype)defaultHistoryMaker;
- (NSAttributedString *)lastSavedExpression;
- (void)saveExpression:(NSAttributedString *)expression;
- (BOOL)clearHistory;

@end
