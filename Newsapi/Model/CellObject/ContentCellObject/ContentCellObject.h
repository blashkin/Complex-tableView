//
//  ContentCellObject.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CellObject.h"

@interface ContentCellObject : NSObject <CellObject>

@property (nonatomic, nonnull) NSAttributedString *content;

+ (nonnull instancetype)updateCellObjectWithContent:(nonnull NSAttributedString *)content;

@end
