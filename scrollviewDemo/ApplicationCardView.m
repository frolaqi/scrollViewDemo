//
//  ApplicationCardView.m
//  scrollviewDemo
//
//  Created by frola on 2018/8/25.
//  Copyright © 2018年 frola. All rights reserved.
//

#import "ApplicationCardView.h"
@implementation ApplicationCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+ (ApplicationCardView *)initScrollCardView{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"ApplicationCardView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"ApplicationCardView" owner:self options:nil] lastObject];
        [self addSubview:view];
    }
    return self;
}
- (IBAction)quickApply:(id)sender {
    NSLog(@"点击button1%ld",(long)self.tag);
}
- (IBAction)cancelApply:(id)sender {
    NSLog(@"点击button1%ld",self.tag);
}

- (void)updateCardViewWithData:(NSString *)data{
    NSLog(@"刷新数据是%@",data);
   self.titleLabel.text = data;
}
@end
