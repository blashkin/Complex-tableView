//
//  SeparatorCellObject.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "SeparatorCellObject.h"
#import "SeparatorTableViewCell.h"

@implementation SeparatorCellObject

#pragma mark - Construction

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color {
    if (self = [super init]) {
        _frame = frame;
        _color = color;
    }
    return self;
}

+ (instancetype)updateCellObjectWithFrame:(CGRect)frame color:(UIColor *)color {
    return [[self alloc]initWithFrame:frame color:color];
}

#pragma mark - CellObject

- (Class)cellClass {
    return [SeparatorTableViewCell class];
}

- (NSString *)cellIdentifier {
    return NSStringFromClass([self cellClass]);
}

@end
