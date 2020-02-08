//
//  PlainCategory.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "PlainCategory.h"

@implementation PlainCategory

+ (NSString *)business {
	return NSStringFromSelector(@selector(business));
}

+ (NSString *)entertainment {
	return NSStringFromSelector(@selector(entertainment));
}

+ (NSString *)health {
	return NSStringFromSelector(@selector(health));
}

+ (NSString *)science {
	return NSStringFromSelector(@selector(science));
}

+ (NSString *)sports {
	return NSStringFromSelector(@selector(sports));
}

+ (NSString *)technology {
	return NSStringFromSelector(@selector(technology));
}

@end
