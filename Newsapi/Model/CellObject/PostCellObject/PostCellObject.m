//
//  PostCellObject.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "PostCellObject.h"
#import "PostTableViewCell.h"
#import "PlainPost.h"

@implementation PostCellObject

#pragma mark - Construction

- (instancetype)initWithPost:(PlainPost *)post {
	if (self = [super init]) {
		_urlToImage = post.urlToImage;
		_source = post.source;
		_desc = [self htmlString:post.desc];
		_publishedAt = post.publishedAt;
	}
	return self;
}

+ (instancetype)updateCellObjectWithPost:(PlainPost *)post {
	return [[self alloc] initWithPost:post];
}

#pragma mark - CellObject

- (Class)cellClass {
    return [PostTableViewCell class];
}

- (NSString *)cellIdentifier {
    return NSStringFromClass([self cellClass]);
}

#pragma mark - Private methods

- (NSAttributedString *)htmlString:(NSString *)string {
	if (string.length == 0) {
		return [[NSAttributedString alloc] initWithString:string];
	}
	
	let options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
					NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)};

	return [[NSAttributedString alloc] initWithData:[string dataUsingEncoding:NSUTF8StringEncoding]
											options:options
								 documentAttributes:nil
											  error:nil];
}

@end
