//
//  SSBodyCell.m
//  iCare2
//
//  Created by Shen Steven on 3/9/13.
//  Copyright (c) 2013 syshen. All rights reserved.
//

#import "SSBodyCell.h"

@implementation SSBodyCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      self.imageView = [[UIImageView alloc] initWithFrame:(CGRect)CGRectMake(0, 0, frame.size.width, frame.size.height)];
      [self.contentView addSubview:self.imageView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
