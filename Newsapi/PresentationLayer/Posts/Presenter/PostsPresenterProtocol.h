//
//  PostsPresenterProtocol.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PostCellObject;
@protocol PostsPresenterProtocol <NSObject>

- (void)requestPosts:(NSUInteger)page;
- (void)requestPostCoverWithURL:(nonnull NSString *)url withSize:(CGSize)size;
- (void)preparePostModuleWithPost:(nonnull PostCellObject *)postCellObject;

@end
