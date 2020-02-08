//
//  PostTableDataManager.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostTableDataManagerProtocol.h"
#import "PostCellObjectFactory.h"

@interface PostTableDataManager : NSObject <PostTableDataManagerProtocol>

- (nonnull instancetype)initWithCellObjectFactory:(nonnull PostCellObjectFactory *)cellObjectFactory;

@end
