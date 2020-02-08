//
//  ImageInfoProtcol.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ImageInfoProtcol <NSObject>

@property (nonatomic, nonnull) NSString *url;
@property (nonatomic) CGSize size;

@end
