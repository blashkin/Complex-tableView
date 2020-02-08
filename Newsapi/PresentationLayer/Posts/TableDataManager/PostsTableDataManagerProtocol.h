//
//  PostsTableDataManagerProtocol.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PlainPost;
@protocol CellObject;
@protocol PostsTableDataManagerProtocol <NSObject, UITableViewDelegate, UITableViewDataSource>

- (void)delegateForTableView:(nonnull UITableView *)tableView;
- (void)updateDataSourceWithPosts:(nonnull NSArray <CellObject> *)posts totalResults:(NSUInteger)totalResults;

- (void)updatePostWithCover:(nonnull NSDictionary<NSString *,UIImage *> *)postCover;
- (void)cleanCache;

@end
