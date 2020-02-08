//
//  PostService.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostServiceProtocol.h"

@protocol NetworkClientProtocol;
@interface PostService : NSObject <PostServiceProtocol>

- (nonnull instancetype)initNetworkClient:(nonnull id <NetworkClientProtocol>)networkClient;

@end
