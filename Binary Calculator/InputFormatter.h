//
//  InputFormatter.h
//  Binary Calculator
//
//  Created by Marco Albera on 20/08/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface InputFormatter : NSObject {
    NSString *_registeredFunctions;
}

- (id)initWithRegisteredFunctions:(NSArray *)registeredFunctions;
- (NSMutableAttributedString *)formatInputString:(NSAttributedString *)inputString;
- (void)applyItalicStyle:(NSMutableAttributedString *)formattedString range:(NSRange)range;
- (NSString *)buildRegularExpressionWithFunctionsArray:(NSArray *)functionsArray;

@end
