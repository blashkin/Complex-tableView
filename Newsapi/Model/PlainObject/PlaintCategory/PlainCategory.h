//
//  PlainCategory.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlainCategory : NSObject

+ (nonnull NSString *)business;
+ (nonnull NSString *)entertainment;
+ (nonnull NSString *)health;
+ (nonnull NSString *)science;
+ (nonnull NSString *)sports;
+ (nonnull NSString *)technology;

@end
