//
//  PostPresenter.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "PostPresenter.h"
#import "PostServiceProtocol.h"
#import "PostCellObjectFactory.h"

@interface PostPresenter()

@property (nonatomic) id <PostServiceProtocol> postService;
@property (nonatomic) PostCellObjectFactory *postCellObjectFactory;

@end

@implementation PostPresenter

- (instancetype)initWithPostService:(id <PostServiceProtocol>)postService cellObjectFactory:(PostCellObjectFactory *)cellObjectFactory {
    if (self = [super init]) {
        _postService = postService;
        _postCellObjectFactory = cellObjectFactory;
    }
    return self;
}

- (void)obtainCellObjectWithPost:(PlainPost *)post {
    [self.delegate updateWithPost:[_postCellObjectFactory createCellObjectsWithPost:post]];
}

@end
