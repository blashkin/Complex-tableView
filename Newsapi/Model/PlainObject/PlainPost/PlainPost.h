//
//  PlainPost.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlainPost : NSObject

@property (nonatomic) NSString *author;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *content;
@property (nonatomic) NSString *desc;
@property (nonatomic) NSString *source;
@property (nonatomic) NSString *urlToImage;
@property (nonatomic) NSString *publishedAt;

@end
