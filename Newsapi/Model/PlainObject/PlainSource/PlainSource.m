//
//  PlainSource.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "PlainSource.h"

@implementation PlainSource

+ (NSString *)category {
	return NSStringFromSelector(@selector(category));
}

+ (NSString *)country {
	return NSStringFromSelector(@selector(country));
}

@end
