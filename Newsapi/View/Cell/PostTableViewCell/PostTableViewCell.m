//
//  PostTableViewCell.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "PostTableViewCell.h"
#import "PostCellObject.h"
#import "PlainImageInfo.h"

@interface PostTableViewCell ()

@property (nonatomic) NSString *imageURL;

@end

@implementation PostTableViewCell

#pragma mark - View lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];

	_coverImageView.layer.cornerRadius = 6.0;
	_sourceLabel.font = [UIFont systemFontOfSize:12.0 weight:UIFontWeightBold];
	_sourceLabel.numberOfLines = 1;
	_descriptionLabel.font = [UIFont systemFontOfSize:12.0 weight:UIFontWeightRegular];
	_descriptionLabel.numberOfLines = 2;
}

- (void)prepareForReuse {
	[super prepareForReuse];
	_coverImageView.image = [UIImage imageNamed:@"image-placeholder-png-7" inBundle:nil compatibleWithTraitCollection:nil];
}

#pragma mark - TableViewCell

+ (CGFloat)heightWithCellObject:(PostCellObject *)cellObject {
	return 270.0;
}

- (void)updateCellWithCellObject:(PostCellObject *)cellObject {
	_imageURL = cellObject.urlToImage;
	_sourceLabel.text = cellObject.source;
	_descriptionLabel.attributedText = cellObject.desc;
}

- (void)updateCellWithImage:(UIImage *)image {
	if (image) {
		_coverImageView.image = image;
	}
}

- (id<ImageInfoProtcol>)imageInfo {
	let info = [PlainImageInfo new];
	info.url = _imageURL;
	info.size = _coverImageView.bounds.size;
	return info;
}

@end
