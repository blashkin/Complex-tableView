//
//  SeparatorTableViewCell.h
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"

@interface SeparatorTableViewCell : UITableViewCell <TableViewCell>

@property (nonatomic, readonly ,nonnull) UIView *separator;

@end
