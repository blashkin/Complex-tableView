//
//  PostPresenter.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostPresenterProtocol.h"

@class PostCellObjectFactory;
@protocol CellObject;
@protocol PostServiceProtocol;
@protocol PostPresenterDelegate <NSObject>

- (void)updateWithPost:(nonnull NSArray <CellObject> *)post;

@end

@interface PostPresenter : NSObject <PostPresenterProtocol>

@property (nonatomic, weak, nullable) id <PostPresenterDelegate> delegate;

- (nonnull instancetype)initWithPostService:(nonnull id <PostServiceProtocol>)postService cellObjectFactory:(nonnull PostCellObjectFactory *)cellObjectFactory;

@end
