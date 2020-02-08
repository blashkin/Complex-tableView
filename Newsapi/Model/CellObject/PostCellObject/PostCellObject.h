//
//  PostCellObject.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PlainPost;
@interface PostCellObject: NSObject

@property (nonatomic, nonnull) NSString *urlToImage;
@property (nonatomic, nonnull) NSString *source;
@property (nonatomic, nonnull) NSAttributedString *desc;
@property (nonatomic, nonnull) NSString *publishedAt;

+ (nonnull instancetype)updateCellObjectWithPost:(nonnull PlainPost *)post;

@end
