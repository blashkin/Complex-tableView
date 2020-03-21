//
//  PostsPresenter.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "PostsPresenter.h"
#import "PostServiceProtocol.h"
#import "PlainSource.h"
#import "PlainCategory.h"
#import "Constant.h"
#import "PostCellObjectFactory.h"
#import "PostCellObject.h"
#import "ModuleFactory.h"

@interface PostsPresenter ()

@property (nonatomic) id <PostServiceProtocol> postService;
@property (nonatomic) PostCellObjectFactory *postCellObjectFactory;
@property (nonatomic) NSMutableArray <PlainPost *> *posts;

@end

@implementation PostsPresenter

#pragma mark - Construction

- (instancetype)initWithPostService:(id <PostServiceProtocol>)postService {
	if (self = [super init]) {
		_postService = postService;
		_postCellObjectFactory = [PostCellObjectFactory new];
		_posts = [NSMutableArray <PlainPost *> new];
	}
	return self;
}

#pragma mark - PostsPresenterProtocol

- (void)requestPosts:(NSUInteger)page {
	let params = @{PlainSource.country: @"us",
				   PlainSource.category: PlainCategory.technology,
				   @"pageSize": @(pageSize),
				   @"page": @(page)};

	__weak typeof(self) weakSelf = self;
	[_postService getPostsWithParams:params completionBlock:^(NSArray<PlainPost *> * _Nonnull posts, NSUInteger totalResults, NSError * _Nullable error) {
		if (error) {
			NSLog(@"%@", error.localizedDescription);
			return;
		}
		[self.posts addObjectsFromArray:posts];
		let cellObjects = [weakSelf.postCellObjectFactory createCellObjectsWithPosts:posts];
		[weakSelf.delegate updateWithPosts:cellObjects totalResults:totalResults];
	}];
}

- (void)requestPostCoverWithURL:(NSString *)url withSize:(CGSize)size {
	if (url.length == 0) {
		return;
	}
	__weak typeof(self) weakSelf = self;
	[_postService getPostCoverWithURL:url completionBlock:^(NSDictionary<NSString *,UIImage *> * _Nonnull postCover, NSError * _Nullable error) {
		if (error) {
			NSLog(@"%@", error.localizedDescription);
			return;
		}
		let resizedPostCover = @{url: [weakSelf resizedImage:postCover[url] withSize:size]};
		dispatch_async(dispatch_get_main_queue(), ^{
			[weakSelf.delegate updatePostWithCover:resizedPostCover];
		});
	}];
}

- (void)preparePostModuleWithPost:(PostCellObject *)postCellObject {
	let predicate = [NSPredicate predicateWithFormat:@"%K = %@", NSStringFromSelector(@selector(publishedAt)), postCellObject.publishedAt];
	let filtered = [_posts filteredArrayUsingPredicate:predicate];
	let post = [filtered firstObject];
	if (!post) {
		return;
	}

	let factory = [ModuleFactory new];
	let controller = [factory createPostModule];
	[controller configureWithPost:post];
	[_delegate showPostView:controller];
}


#pragma mark - Private methods

- (UIImage *)resizedImage:(UIImage *)image withSize:(CGSize)size {
	let renderer = [[UIGraphicsImageRenderer alloc] initWithSize:size];
	return [renderer imageWithActions:^(UIGraphicsImageRendererContext * _Nonnull rendererContext) {
		[image drawInRect:CGRectMake(0.0, 0.0, size.width, size.height)];
	}];
}

@end
