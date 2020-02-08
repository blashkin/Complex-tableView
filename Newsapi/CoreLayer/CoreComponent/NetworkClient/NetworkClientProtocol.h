//
//  NetworkClientProtocol.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NetworkClientCompletion)(_Nonnull id data, NSError * _Nullable error);

@protocol NetworkClientProtocol <NSObject>

- (void)requestWithURL:(nonnull NSURL *)url completionBlock:(nonnull NetworkClientCompletion)completion;

@end
