//
//  ContentTableViewCell.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "ContentTableViewCell.h"
#import "ContentCellObject.h"

@implementation ContentTableViewCell

#pragma mark - View lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];

}

#pragma mark - TableViewCell

+ (CGFloat)heightWithCellObject:(ContentCellObject *)cellObject {
	return [self calculateHeightOfTheText:cellObject.content];
}

- (void)updateCellWithCellObject:(ContentCellObject *)cellObject {
	self.textLabel.numberOfLines = 0;
    self.textLabel.attributedText = cellObject.content;
}

#pragma mark - Private methods

+ (CGFloat)calculateHeightOfTheText:(NSAttributedString *)text {
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 32;
    CGRect frame = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                      options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      context:nil];

    return ceilf(frame.size.height) + 8;
}

@end
