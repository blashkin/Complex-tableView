//
//  NetworkClient.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "NetworkClient.h"

@interface NetworkClient ()

@property (nonatomic) NSURLSession *session;
@property (nonatomic) NSURLSessionDataTask *dataTask;

@end

@implementation NetworkClient

#pragma mark - NetworkClientProtocol

- (void)requestWithURL:(NSURL *)url completionBlock:(NetworkClientCompletion)completion {
	_dataTask = [self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		completion(data, error);
	}];
	[_dataTask resume];
}

- (NSURLSession *)session {
	if (!_session) {
		let configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
		configuration.requestCachePolicy = NSURLRequestReloadRevalidatingCacheData;
		_session = [NSURLSession sessionWithConfiguration:configuration];
	}
	return _session;
}

@end
