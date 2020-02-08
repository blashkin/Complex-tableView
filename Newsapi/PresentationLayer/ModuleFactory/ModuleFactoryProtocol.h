//
//  ModuleFactoryProtocol.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostsViewController.h"
#import "PostViewController.h"

@protocol PostsViewControllerProtocol;
@protocol PostViewControllerProtocol;
@protocol ModuleFactoryProtocol <NSObject>

- (nonnull PostsViewController <PostsViewControllerProtocol> *)createPostsModule;
- (nonnull PostViewController <PostViewControllerProtocol> *)createPostModule;

@end
