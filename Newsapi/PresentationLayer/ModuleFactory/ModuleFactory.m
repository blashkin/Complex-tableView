//
//  ModuleFactory.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "ModuleFactory.h"
#import "PostsPresenter.h"
#import "PostsViewController.h"
#import "PostsTableDataManager.h"
#import "PostService.h"
#import "NetworkClient.h"

#import "PostPresenter.h"
#import "PostViewController.h"
#import "PostTableDataManager.h"

@implementation ModuleFactory

#pragma mark - ModuleFactoryProtocol

- (PostsViewController <PostsViewControllerProtocol> *)createPostsModule {
	let tableDataManager = [PostsTableDataManager new];
	let service = [[PostService alloc] initNetworkClient:[NetworkClient new]];
	let presenter = [[PostsPresenter alloc] initWithPostService:service cellObjectFactory:[PostCellObjectFactory new]];
	let controller = [[PostsViewController alloc] initWithPresenter:presenter];
	controller.title = @"News";
	controller.tableDataManager = tableDataManager;
	presenter.delegate = controller;
	tableDataManager.delegate = controller;
	return controller;
}

- (PostViewController <PostViewControllerProtocol> *)createPostModule {
    let service = [[PostService alloc] initNetworkClient:[NetworkClient new]];
    let presenter = [[PostPresenter alloc] initWithPostService:service cellObjectFactory:[PostCellObjectFactory new]];
	let controller = [[PostViewController alloc] initWithPresenter:presenter];
	controller.tableDataManager = [PostTableDataManager new];
	presenter.delegate = controller;
	return (PostViewController <PostViewControllerProtocol> *)controller;
}

@end
