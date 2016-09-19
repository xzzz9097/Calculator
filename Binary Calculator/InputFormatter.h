//
//  InputFormatter.h
//  Binary Calculator
//
//  Created by Marco Albera on 20/08/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface InputFormatter : NSFormatter

@property (nonatomic) NSString *registeredFunctions;
@property (nonatomic) id originalStringAttributes;

- (id)initWithRegisteredFunctions:(NSArray *)registeredFunctions;
- (void)applyItalicStyle:(NSMutableAttributedString *)formattedString range:(NSRange)range;
- (void)saveOriginalStyle:(NSAttributedString *)originalString;
- (void)restoreOriginalStyle:(NSMutableAttributedString *)formattedString range:(NSRange)range;
- (NSString *)buildRegularExpressionWithFunctionsArray:(NSArray *)functionsArray;

@end
