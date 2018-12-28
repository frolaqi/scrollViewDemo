//
//  ApplicationViewController.h
//  scrollviewDemo
//
//  Created by frola on 2018/8/25.
//  Copyright © 2018年 frola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApplyPageControllView.h"
@interface ApplicationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) IBOutlet ApplyPageControllView *pageControll;

@end
