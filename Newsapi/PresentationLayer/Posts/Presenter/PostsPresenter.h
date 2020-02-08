//
//  PostsPresenter.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostsPresenterProtocol.h"
#import "PlainPost.h"
#import "PostCellObjectFactory.h"

@protocol CellObject;
@protocol PostsPresenterDelegate <NSObject>

- (void)updateWithPosts:(nonnull NSArray <CellObject> *)posts totalResults:(NSUInteger)totalResults;
- (void)updatePostWithCover:(nonnull NSDictionary<NSString *,UIImage *> *)postCover;
- (void)showPostView:(nonnull UIViewController *)controller;

@end

@protocol PostServiceProtocol;
@interface PostsPresenter : NSObject <PostsPresenterProtocol>

@property (nonatomic, weak, nullable) id <PostsPresenterDelegate> delegate;
@property (nonatomic, nonnull) PostCellObjectFactory *cellObjectFactory;

- (nonnull instancetype)initWithPostService:(nonnull id <PostServiceProtocol>)postService;

@end
