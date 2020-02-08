//
//  ContentCellObject.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "ContentCellObject.h"
#import "ContentTableViewCell.h"

@implementation ContentCellObject

#pragma mark - Construction

- (instancetype)initWithContent:(NSAttributedString *)content {
    if (self = [super init]) {
        _content = content;
    }
    return self;
}

+ (instancetype)updateCellObjectWithContent:(NSAttributedString *)content {
    return [[self alloc]initWithContent:content];
}

#pragma mark - CellObject

- (nonnull Class)cellClass {
	return [ContentTableViewCell class];
}

- (nonnull NSString *)cellIdentifier {
    return NSStringFromClass([self cellClass]);
}

@end
