//
//  PlainImageInfo.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageInfoProtcol.h"

@interface PlainImageInfo : NSObject <ImageInfoProtcol>

@property (nonatomic) NSString *url;
@property (nonatomic) CGSize size;

@end
