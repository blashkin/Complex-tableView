//
//  PostsTableDataManager.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "PostsTableDataManagerProtocol.h"

@class PostCellObject;
@protocol PostsTableDataManagerDelegate <NSObject>

- (void)requestPostCoverWithURL:(nonnull NSString *)url withSize:(CGSize)size;
- (void)loadMorePostsOnPage:(NSUInteger)page;
- (void)didSelectPost:(nonnull PostCellObject *)postCellObject;

@end

@interface PostsTableDataManager: NSObject <PostsTableDataManagerProtocol>

@property (nonatomic, weak, nullable) id <PostsTableDataManagerDelegate> delegate;

@end
