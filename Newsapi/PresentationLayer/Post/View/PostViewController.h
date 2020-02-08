//
//  PostViewController.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostPresenter.h"
#import "PostTableDataManagerProtocol.h"

@class PlainPost;
@protocol PostViewControllerProtcol <NSObject>

- (void)configureWithPost:(nonnull PlainPost *)post;

@end

@protocol PostPresenterProtocol;
@interface PostViewController : UIViewController <PostViewControllerProtcol, PostPresenterDelegate>

@property (nonatomic, nonnull) id <PostTableDataManagerProtocol> tableDataManager;

- (nonnull instancetype)initWithPresenter:(nonnull id <PostPresenterProtocol>)presenter;

@end
