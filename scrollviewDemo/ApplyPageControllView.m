//
//  ApplyPageControllView.m
//  scrollviewDemo
//
//  Created by frola on 2018/8/25.
//  Copyright © 2018年 frola. All rights reserved.
//

#import "ApplyPageControllView.h"

@implementation ApplyPageControllView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) setCurrentPage:(NSInteger)page {
    [super setCurrentPage:page];
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
        CGSize size;
        size.height = 5;
        size.width = 5;
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
                                     size.width,size.height)];


    }
}

@end
