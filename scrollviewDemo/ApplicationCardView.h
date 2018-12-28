//
//  ApplicationCardView.h
//  scrollviewDemo
//
//  Created by frola on 2018/8/25.
//  Copyright © 2018年 frola. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplicationCardView : UIView

+ (ApplicationCardView *)initScrollCardView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)updateCardViewWithData:(NSString *)data;
@end
