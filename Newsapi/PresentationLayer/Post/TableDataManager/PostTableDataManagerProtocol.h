//
//  PostTableDataManagerProtocol.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PlainPost;
@protocol PostTableDataManagerProtocol <NSObject, UITableViewDelegate, UITableViewDataSource>

- (void)delegateForTableView:(nonnull UITableView *)tableView;
- (void)updateDataSourceWithPost:(nonnull PlainPost *)post;

@end
