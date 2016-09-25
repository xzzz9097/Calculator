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
    NSUInteger _requestedIndex;
}

- (id)init {
    self = [super init];

    if (self) {
        _historyArray = [[NSMutableArray alloc] initWithCapacity:10];
        [self resetRequest];
    }

    return self;
}

+ (instancetype)defaultHistoryMaker {
    return [[self alloc] init];
}

- (NSAttributedString *)lastSavedExpression {
    return [_historyArray lastObject];
}

- (void)saveExpression:(NSAttributedString *)expression {
    if (![_historyArray containsObject:expression]) {
        [_historyArray addObject:expression];
    }
}

- (BOOL)clearHistory {
    [_historyArray removeAllObjects];

    return ([_historyArray firstObject] == nil);
}

- (void)resetRequest {
    _requestedIndex = 0;
}

- (NSInteger)requestedItemIndex {
    return [_historyArray count] - _requestedIndex - 1;
}

- (NSAttributedString *)previousSavedExpression {
    NSInteger index = [self requestedItemIndex];

    if (index > -1) {
        _requestedIndex++;
        return [_historyArray objectAtIndex:index];
    }

    return nil;
}

@end
