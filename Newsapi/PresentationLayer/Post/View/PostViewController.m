//
//  PostViewController.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "PostViewController.h"
#import "PlainPost.h"

@interface PostViewController ()

@property (nonatomic) UITableView *tableView;
@property (nonatomic) id <PostPresenterProtocol> presenter;

@end

@implementation PostViewController

#pragma mark - Construction

- (instancetype)initWithPresenter:(id <PostPresenterProtocol>)presenter {
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
	_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - PostPresenterDelegate

- (void)configureWithPost:(PlainPost *)post {
    [_presenter obtainCellObjectWithPost:post];
}

- (void)updateWithPost:(NSArray <CellObject> *)post {
    [_tableDataManager updateDataSourceWithPost:post];
}

#pragma mark - Setters & Getters

- (void)setTableView:(UITableView *)tableView {
    [_tableDataManager delegateForTableView:tableView];

	tableView.allowsSelection = NO;
	tableView.tableFooterView = [UIView new];
    _tableView = tableView;
}

@end
