//
//  PostPresenter.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostPresenterProtocol.h"

@protocol PostPresenterDelegate <NSObject>

@end

@interface PostPresenter : NSObject <PostPresenterProtocol>

@property (nonatomic, weak) id <PostPresenterDelegate> delegate;

@end
