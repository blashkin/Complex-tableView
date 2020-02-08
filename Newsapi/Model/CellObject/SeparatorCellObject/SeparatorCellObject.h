//
//  SeparatorCellObject.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CellObject.h"

@interface SeparatorCellObject : NSObject <CellObject>

@property (nonatomic) CGRect frame;
@property (nonatomic, nonnull) UIColor *color;

+ (nonnull instancetype)updateCellObjectWithFrame:(CGRect)frame color:(nonnull UIColor *)color;

@end
