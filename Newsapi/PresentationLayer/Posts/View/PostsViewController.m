//
//  PostsViewController.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "PostsViewController.h"
#import "PostsTableDataManager.h"
#import "PostTableViewCell.h"

@interface PostsViewController ()

@property (nonatomic) UITableView *tableView;
@property (nonatomic) UIActivityIndicatorView *spinner;
@property (nonatomic) UIRefreshControl *refreshControl;
@property (nonatomic) id <PostsPresenterProtocol> presenter;
@property (nonatomic) NSUInteger currentPage;

@end

@implementation PostsViewController

#pragma mark - Construction

- (instancetype)initWithPresenter:(id <PostsPresenterProtocol>)presenter {
	if (self = [super init]) {
		_presenter = presenter;
	}
	return self;
}

#pragma mark - View lifecycle

- (void)loadView {
	self.tableView = [UITableView new];
	self.view = _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - PostsViewControllerProtocol

- (void)configure {
	_tableView.tableFooterView = [UIView new];
	_currentPage = 1;
	[_presenter requestPosts:_currentPage];
}

#pragma mark - PostsPresenterDelegate

- (void)updateWithPosts:(NSArray<CellObject> *)posts totalResults:(NSUInteger)totalResults {
	if (_refreshControl.isRefreshing) {
		[_refreshControl endRefreshing];

		[_tableDataManager cleanCache];
	}

	[_tableDataManager updateDataSourceWithPosts:posts totalResults:totalResults];
	[_spinner stopAnimating];
}

- (void)updatePostWithCover:(NSDictionary<NSString *,UIImage *> *)postCover {
	[_tableDataManager updatePostWithCover: postCover];
}

- (void)showPostView:(UIViewController *)controller {
	[self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - PostsTableDataManagerDelegate

- (void)requestPostCoverWithURL:(NSString *)url withSize:(CGSize)size {
	[_presenter requestPostCoverWithURL:url withSize:size];
}

- (void)loadMorePostsOnPage:(NSUInteger)page {
	_currentPage = page;
	[_spinner startAnimating];
	[_presenter requestPosts:_currentPage];
}

- (void)didSelectPost:(PostCellObject *)postCellObject {
	[_presenter preparePostModuleWithPost:postCellObject];
}

#pragma mark - Private methods

- (void)pullToRefresh {
	[_presenter requestPosts:1];
	[_spinner stopAnimating];
}

#pragma mark - Setters & Getters

- (void)setTableView:(UITableView *)tableView {
	[tableView addSubview:self.refreshControl];
	tableView.tableFooterView = self.spinner;
	[_tableDataManager delegateForTableView:tableView];

	_tableView = tableView;
}

- (UIActivityIndicatorView *)spinner {
	if (!_spinner) {
		_spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		[_spinner hidesWhenStopped];
		[_spinner startAnimating];
	}
	return _spinner;
}

- (UIRefreshControl *)refreshControl {
	if (!_refreshControl) {
		_refreshControl = [UIRefreshControl new];
		[_refreshControl setTintColor:[UIColor lightGrayColor]];

		[_refreshControl addTarget:self
							action:@selector(pullToRefresh)
				  forControlEvents:UIControlEventValueChanged];
	}
	return _refreshControl;
}

@end
