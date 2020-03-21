//
//  PostService.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "PostService.h"
#import "API.h"
#import "PlainPost.h"
#import "PlainSource.h"
#import "PlainCategory.h"
#import "NetworkClientProtocol.h"
#import "UIImage+Scale.h"

@interface PostService ()

@property (nonatomic) id <NetworkClientProtocol> networkClient;

@end

@implementation PostService

#pragma mark - Construction

- (instancetype)initNetworkClient:(id <NetworkClientProtocol>)networkClient {
	if (self = [super init]) {
		_networkClient = networkClient;
	}
	return self;
}

#pragma mark - PostServiceProtocol

- (void)getPostsWithParams:(NSDictionary *)params completionBlock:(PostCompletion)completion {
	if (!params || params.count == 0) {
        completion(@[], 0, nil);
		return;
	}
	let url = [self urlWithParams:params];
    
    __weak typeof(self) weakSelf = self;
	[_networkClient requestWithURL:url completionBlock:^(id  _Nonnull data, NSError * _Nullable error) {
		NSUInteger totalResults = 0;
		if (data) {
			let json = [weakSelf JSONObjectWithData:data];
			NSArray <NSDictionary *> *articles = json[@"articles"];
			totalResults =  [json[@"totalResults"] unsignedIntegerValue];
			var posts = [NSMutableArray new];
			for (NSDictionary *article in articles) {
				let post = [PlainPost new];
				post.author = article[NSStringFromSelector(@selector(author))];
				post.title = article[NSStringFromSelector(@selector(title))];
				post.content = article[NSStringFromSelector(@selector(content))];
				post.desc = article[NSStringFromSelector(@selector(description))];
				post.source = [article valueForKeyPath:@"source.name"];
				post.urlToImage = article[NSStringFromSelector(@selector(urlToImage))];
				post.publishedAt = article[NSStringFromSelector(@selector(publishedAt))];
				[posts addObject:post];
			}
			dispatch_async(dispatch_get_main_queue(), ^{
				completion(posts, totalResults, nil);
			});
		} else if (error) {
			dispatch_async(dispatch_get_main_queue(), ^{
				completion(@[], totalResults, error);
			});
		}
	}];
}

- (void)getPostCoverWithURL:(NSString *)url completionBlock:(nonnull PostCoverCompletion)completion {
	let validedURL = [self validateURL:url];
	if (!validedURL) {
		completion(@{}, nil);
		return;
	}
	[_networkClient requestWithURL:validedURL completionBlock:^(id _Nonnull data, NSError * _Nullable error) {
		let cover = [UIImage imageWithData:data];
		if (cover) {
			completion(@{url: cover}, nil);
		} else if (error) {
			dispatch_async(dispatch_get_main_queue(), ^{
				completion(@{}, error);
			});
		}
	}];
}

#pragma mark - Private methods

- (nullable NSURL *)validateURL:(NSString *)url {
	let validURL = [NSURL URLWithString:url];
	if ([validURL scheme] && [validURL host]) {
		return validURL;
	} else {
		return nil;
	}
}

- (nullable NSDictionary *)JSONObjectWithData:(NSData *)data {
	NSError *jsonSerializationError;
	NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonSerializationError];
	if (jsonSerializationError) {
		NSLog(@"%@", [jsonSerializationError localizedDescription]);
	}
	return json;
}

- (NSURL *)urlWithParams:(NSDictionary *)params {
	var urlComponents = [NSURLComponents new];
	urlComponents.scheme = @"https";
	urlComponents.host = @"newsapi.org";
	urlComponents.path = @"/v2/top-headlines";
	let country = PlainSource.country;
	let category = PlainSource.category;
	let page = [NSString stringWithFormat:@"%@", params[@"page"]];
	let pageSize = [NSString stringWithFormat:@"%@", params[@"pageSize"]];

	let localeQuery = [NSURLQueryItem queryItemWithName:country value:params[country]];
	let categoryQuery = [NSURLQueryItem queryItemWithName:category value:params[category]];
	let pageQuery = [NSURLQueryItem queryItemWithName:@"page" value:page];
	let pageSizeQuery = [NSURLQueryItem queryItemWithName:@"pageSize" value:pageSize];
	let apiKeyQuery = [NSURLQueryItem queryItemWithName:@"apiKey" value:apiKey];
	urlComponents.queryItems = @[localeQuery, categoryQuery, pageQuery, pageSizeQuery, apiKeyQuery];
	return urlComponents.URL;
}

@end
