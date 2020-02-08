//
//  TableViewCell.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ImageInfoProtcol.h"

@protocol CellObject;
@protocol TableViewCell <NSObject>

- (void)updateCellWithCellObject:(nonnull id <CellObject>)cellObject;
+ (CGFloat)heightWithCellObject:(nonnull id <CellObject>)cellObject;

@optional

- (nonnull id <ImageInfoProtcol>)imageInfo;
- (void)updateCellWithImage:(nonnull UIImage *)image;

@end
