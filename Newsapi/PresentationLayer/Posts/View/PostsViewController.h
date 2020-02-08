//
//  PostsViewController.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostsPresenter.h"
#import "PostsTableDataManager.h"

@protocol PostsViewControllerProtocol <NSObject>

- (void)configure;

@end

@protocol PostsPresenterProtocol;
@protocol PostsTableDataManagerProtocol;
@interface PostsViewController : UIViewController <PostsViewControllerProtocol, PostsPresenterDelegate, PostsTableDataManagerDelegate>

@property (nonatomic, nonnull) id <PostsTableDataManagerProtocol> tableDataManager;

- (nonnull instancetype)initWithPresenter:(nonnull id <PostsPresenterProtocol>)presenter;

@end
