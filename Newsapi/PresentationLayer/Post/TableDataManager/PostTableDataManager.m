//
//  PostTableDataManager.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "PostTableDataManager.h"
#import "CellObject.h"
#import "TableViewCell.h"
#import "PostCellObjectFactory.h"
#import "Constant.h"

@interface PostTableDataManager ()

@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSMutableArray <CellObject> *cellObjects;
@property (nonatomic) NSMutableDictionary *cellIdentifiers;

@end

@implementation PostTableDataManager

#pragma mark - Construction

- (instancetype)init {
	if (self = [super init]) {
		_cellObjects = [NSMutableArray <CellObject> new];
		_cellIdentifiers = [NSMutableDictionary new];
	}
	return self;
}

#pragma mark - PostTableDataManagerProtocol

- (void)delegateForTableView:(UITableView *)tableView {
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)updateDataSourceWithPost:(NSArray <CellObject> *)post {
	[_cellObjects addObjectsFromArray:post];
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

	return (UITableViewCell *)cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return _cellObjects.count;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	id <CellObject> cellObject = _cellObjects[indexPath.row];
	return [[cellObject cellClass] heightWithCellObject:cellObject];
}

#pragma mark - Helpers

- (void)registerCellNibsWithCellIdentifier:(NSString *)cellIdentifier {
    [_tableView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellReuseIdentifier:cellIdentifier];
	_cellIdentifiers[cellIdentifier] = cellIdentifier;
}

@end
