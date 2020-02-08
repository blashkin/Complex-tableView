//
//  PostServiceProtocol.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PlainPost;
typedef void(^PostCompletion)(NSArray <PlainPost *> * _Nonnull posts, NSUInteger totalResults, NSError * _Nullable error);
typedef void(^PostCoverCompletion)(NSDictionary <NSString *, UIImage *> * _Nonnull postCover, NSError * _Nullable error);

@protocol PostServiceProtocol <NSObject>

- (void)getPostsWithParams:(nonnull NSDictionary *)params completionBlock:(nonnull PostCompletion)completion;
- (void)getPostCoverWithURL:(nonnull NSString *)url completionBlock:(nonnull PostCoverCompletion)completion;

@end
