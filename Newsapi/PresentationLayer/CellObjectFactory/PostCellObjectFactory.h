//
//  PostCellObjectFactory.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PlainPost;
@protocol CellObject;
@interface PostCellObjectFactory : NSObject

- (nonnull NSArray <CellObject> *)createCellObjectsWithPosts:(nonnull NSArray <PlainPost *> *)posts;
- (nonnull NSArray <CellObject> *)createCellObjectsWithPost:(nonnull PlainPost *)post;

@end
