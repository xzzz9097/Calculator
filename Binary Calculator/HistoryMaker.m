//
//  HistoryMaker.m
//  Mathematica
//
//  Created by Marco Albera on 21/09/16.
//  Copyright © 2016 Edge Apps. All rights reserved.
//

#import "HistoryMaker.h"

@implementation HistoryMaker {
    NSMutableArray *_historyArray;
}

- (id)init {
    self = [super init];

    if (self) {
        _historyArray = [[NSMutableArray alloc] init];
    }

    return self;
}

+ (instancetype)defaultHistoryMaker {
    return [[self alloc] init];
}

- (NSString *)lastSavedExpression {
    return [_historyArray lastObject];
}

- (void)saveExpression:(NSAttributedString *)expression {
    [_historyArray addObject:expression];
}

- (BOOL)clearHistory {
    [_historyArray removeAllObjects];

    return ([_historyArray firstObject] == nil);
}

@end
