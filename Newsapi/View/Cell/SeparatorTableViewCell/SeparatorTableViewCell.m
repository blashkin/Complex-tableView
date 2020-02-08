//
//  SeparatorTableViewCell.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "SeparatorTableViewCell.h"
#import "SeparatorCellObject.h"

@interface SeparatorTableViewCell ()

@property (nonatomic, nonnull) UIView *separator;

@end

@implementation SeparatorTableViewCell

#pragma mark - View lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];

	self.userInteractionEnabled = NO;

	_separator = [UIView new];
	_separator.backgroundColor = [UIColor groupTableViewBackgroundColor];
	[self.contentView addSubview:self.separator];
}

#pragma mark - TableViewCell

+ (CGFloat)heightWithCellObject:(SeparatorCellObject *)cellObject {
	return cellObject.frame.size.height;
}

- (void)updateCellWithCellObject:(SeparatorCellObject *)cellObject {
    _separator.frame = cellObject.frame;
    _separator.backgroundColor = cellObject.color;
}

@end
