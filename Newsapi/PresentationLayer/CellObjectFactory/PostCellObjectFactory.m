//
//  PostCellObjectFactory.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "PostCellObjectFactory.h"
#import "PlainPost.h"
#import "CellObject.h"
#import "PostCellObject.h"
#import "ContentCellObject.h"
#import "SeparatorCellObject.h"

@implementation PostCellObjectFactory

- (NSArray <CellObject> *)createCellObjectsWithPosts:(NSArray <PlainPost *> *)posts {
	let cellObjects = [NSMutableArray <CellObject> new];
	for (PlainPost *post in posts) {
		[cellObjects addObject:[PostCellObject updateCellObjectWithPost:post]];
	}
	return cellObjects;
}

- (NSArray <CellObject> *)createCellObjectsWithPost:(PlainPost *)post {
	let cellObjects = [NSMutableArray <CellObject> new];

	let titleAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:16 weight:UIFontWeightHeavy], NSForegroundColorAttributeName: [UIColor darkTextColor]};
	let attrTitle = [[NSAttributedString alloc] initWithString:post.title attributes:titleAttributes];
	let titleCellObject = [ContentCellObject updateCellObjectWithContent:attrTitle];
	[cellObjects addObject:titleCellObject];

	let bounds = [UIScreen mainScreen].bounds;
	let frame = CGRectMake(16, 0, bounds.size.width - 32, 1);
	let separatorCellObject = [SeparatorCellObject updateCellObjectWithFrame:frame color:[UIColor groupTableViewBackgroundColor]];
	[cellObjects addObject:separatorCellObject];

	let contentAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14 weight:UIFontWeightRegular], NSForegroundColorAttributeName: [UIColor darkTextColor]};
	let attrContent = [[NSAttributedString alloc] initWithString:post.content attributes: contentAttributes];
	let contentCellObject = [ContentCellObject updateCellObjectWithContent:attrContent];
	[cellObjects addObject:contentCellObject];

	return cellObjects;
}

@end
