//
//  PlainPost.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "PlainPost.h"

@implementation PlainPost

- (void)setAuthor:(NSString *)author {
	_author = author == nil || [author isKindOfClass:[NSNull class]] ? @"" : author;
}

- (void)setTitle:(NSString *)title {
	_title = title == nil || [title isKindOfClass:[NSNull class]] ? @"" : title;
}

- (void)setContent:(NSString *)content {
	_content = content == nil || [content isKindOfClass:[NSNull class]] ? @"" : content;
}

- (void)setDesc:(NSString *)desc {
	_desc = desc == nil || [desc isKindOfClass:[NSNull class]] ? @"" : desc;
}

- (void)setSource:(NSString *)source {
	_source = source == nil || [source isKindOfClass:[NSNull class]] ? @"" : source;
}

- (void)setUrlToImage:(NSString *)urlToImage {
	_urlToImage = urlToImage == nil || [urlToImage isKindOfClass:[NSNull class]] ? @"" : urlToImage;
}

- (void)setPublishedAt:(NSString *)publishedAt {
	_publishedAt = publishedAt == nil || [publishedAt isKindOfClass:[NSNull class]] ? @"" : publishedAt;
}

@end
