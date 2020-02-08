//
//  PostsTableDataManager.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "PostsTableDataManager.h"
#import "CellObject.h"
#import "TableViewCell.h"
#import "PostTableViewCell.h"
#import "Constant.h"

@interface PostsTableDataManager ()

@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSMutableArray <CellObject> *cellObjects;
@property (nonatomic) NSMutableDictionary *cellIdentifiers;
@property (nonatomic) NSMutableDictionary <NSString *,UIImage *> *postCovers;

@property (nonatomic) NSUInteger totalResults;
@property (nonatomic) NSUInteger nextPage;
@property (nonatomic) NSUInteger totalPages;

@end

@implementation PostsTableDataManager

#pragma mark - Construction

- (instancetype)init {
	if (self = [super init]) {
		_cellObjects = [NSMutableArray <CellObject> new];
		_cellIdentifiers = [NSMutableDictionary new];
		_postCovers = [NSMutableDictionary new];
	}
	return self;
}

#pragma mark - PostsTableDataManagerProtocol

- (void)delegateForTableView:(UITableView *)tableView {
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)updateDataSourceWithPosts:(NSArray <CellObject> *)posts totalResults:(NSUInteger)totalResults {
	_totalResults = totalResults;
	_nextPage = 1;
	_totalPages = ceil((double)_totalResults / pageSize);

	[_cellObjects addObjectsFromArray:posts];
	[_tableView reloadData];
}

- (void)updatePostWithCover:(NSDictionary<NSString *,UIImage *> *)postCover {
	[_postCovers addEntriesFromDictionary:postCover];

	for (id <TableViewCell> cell in _tableView.visibleCells) {
		[cell updateCellWithImage:_postCovers[cell.imageInfo.url]];
	}
}

- (void)cleanCache {
	_nextPage = 1;
	_totalResults = 0;
	_totalPages = 0;
	[_cellObjects removeAllObjects];
	[_tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
	id <CellObject> cellObject = _cellObjects[indexPath.row];
	let cellIdentifier = [cellObject cellIdentifier];

	if (!_cellIdentifiers[cellIdentifier]) {
		[self registerCellNibsWithCellIdentifier:cellIdentifier];
	}

	id <TableViewCell> cell = [tableView dequeueReusableCellWithIdentifier:[cellObject cellIdentifier] forIndexPath:indexPath];
	[cell updateCellWithCellObject:cellObject];

	let postCover = _postCovers[cell.imageInfo.url];
	if (postCover) {
		[cell updateCellWithImage:postCover];
	} else {
		[_delegate requestPostCoverWithURL:cell.imageInfo.url withSize: cell.imageInfo.size];
	}

	return (UITableViewCell *)cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return _cellObjects.count;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	[_delegate didSelectPost:_cellObjects[indexPath.row]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	id <CellObject> cellObject = _cellObjects[indexPath.row];
	return [[cellObject cellClass] heightWithCellObject:cellObject];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	let cellObjectsCount = _cellObjects.count;
	let trigger = cellObjectsCount - 5;
	if (indexPath.row == trigger &&
		_totalResults >= cellObjectsCount &&
		_totalPages >= _nextPage) {
		_nextPage += 1;
		[_delegate loadMorePostsOnPage:_nextPage];
	}
}

#pragma mark - Helpers

- (void)registerCellNibsWithCellIdentifier:(NSString *)cellIdentifier {
    [_tableView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellReuseIdentifier:cellIdentifier];
	_cellIdentifiers[cellIdentifier] = cellIdentifier;
}

@end
