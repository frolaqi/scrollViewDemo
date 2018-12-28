//
//  ApplicationViewController.m
//  scrollviewDemo
//
//  Created by frola on 2018/8/25.
//  Copyright © 2018年 frola. All rights reserved.
//

#import "ApplicationViewController.h"
#import "ApplicationCardView.h"
@interface ApplicationViewController ()<UIScrollViewDelegate,UIPageViewControllerDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollvieWidth;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation ApplicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray =[[NSMutableArray alloc]initWithObjects:@"我是老大",@"我是老二",@"我是老三", nil];
    
    self.contentView.frame = CGRectMake(0, 100, self.view.bounds.size.width, 250);
    self.scrollview.frame = CGRectMake(12, 0, self.view.bounds.size.width - 12*2, self.contentView.bounds.size.height - 70);
    self.pageControll = [[ApplyPageControllView alloc]init];
    self.pageControll.frame = CGRectMake(0, _scrollview.bounds.size.height, 100, 20);
    
    float width = self.scrollview.frame.size.width;
    float height = self.scrollview.frame.size.height;
    
    self.scrollview.frame = _scrollview.bounds;
    int count = (int)_dataArray.count;
    self.scrollvieWidth.constant = width;
    for (int i = 0; i < count; i ++) {
        float x = i * _scrollview.frame.size.width;
        ApplicationCardView *cardView = [[ApplicationCardView alloc]initWithFrame:CGRectMake(x + 12, 0, width -12*2, _scrollview.frame.size.height)];
        cardView.titleLabel.text = self.dataArray[i];
        cardView.tag = i;
        [_scrollview addSubview:cardView];
        
    }
    
    //设置滚动范围
    self.scrollview.contentSize=CGSizeMake(count*width, 0);
    
    //隐藏水平滚动条
    
    self.scrollview.showsHorizontalScrollIndicator=NO; //不显示水平滑动线
    
    self.scrollview.showsVerticalScrollIndicator=NO;//不显示垂直滑动线
    
    self.scrollview.pagingEnabled=YES;//设置分页
    
    
    //添加pagecontrol
    //设置页数
    
    self.pageControll.numberOfPages=count;
    
    //当前选中页码
    self.pageControll.currentPage=0; //初始页码为 0
    
    self.pageControll.currentPageIndicatorTintColor=[UIColor grayColor];
    
    //其他页码
    
    self.pageControll.pageIndicatorTintColor=[UIColor blackColor];
    
    
    
    [self.pageControll addTarget:self action:@selector(pageChange) forControlEvents:UIControlEventValueChanged];

    //设置代理
    
    _scrollview.delegate=self;
    
    //弹簧效果
    
    _scrollview.bounces=NO;
    
}

-(void)pageChange{
    
    int page=(int) self.pageControll.currentPage;
    
    CGFloat offSetX = page*self.scrollview.frame.size.width;
    
    [UIView beginAnimations:nil context:nil];
    
    self.scrollview.contentOffset=CGPointMake(offSetX, 0);
    
    [UIView commitAnimations];
    
    
    
}

//滚动代理  scroll减速完毕调用

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if(scrollView==self.scrollview){
        CGFloat pageWidth = scrollView.frame.size.width;

        int currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        NSLog(@"当前是第%d个page",currentPage);
        self.pageControll.currentPage = currentPage;

        [scrollView setContentOffset:CGPointMake(self.scrollview.bounds.size.width * currentPage,scrollView.contentOffset.y) animated:YES]; //设置scrollview的显示为当前滑动到的页面
        
        ApplicationCardView *cardview = self.scrollview.subviews[currentPage];
        cardview.titleLabel.text =_dataArray[currentPage];

    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
