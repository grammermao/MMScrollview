//
//  MMScrollView.m
//  MMScroviewDemo
//
//  Created by yuchen_Mac on 2017/8/18.
//  Copyright © 2017年 yc. All rights reserved.
//

#import "MMScrollView.h"
#import "MMScroviewTool.h"


#define SELF_WIDTH self.view.frame.size.width
#define SELF_HEIGHT self.view.frame.size.height


@interface MMScrollView ()<UIScrollViewDelegate,ScrollviewAction>{
    MMScroviewTool *_scrollview;
    NSTimer *_timer;
}

@end

@implementation MMScrollView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor grayColor];
    [UIApplication sharedApplication].statusBarStyle =UIStatusBarStyleDefault;
    [self init_ui];
}


-(void)init_ui{
    CGFloat scrollX =SELF_WIDTH *0.8;
    CGFloat scrollY =SELF_HEIGHT *0.7;
    CGRect frame =CGRectMake(0, 0, scrollX, scrollY);
    UIView *s_scrollview =[[UIView alloc]initWithFrame:frame];
    s_scrollview.backgroundColor =[UIColor clearColor];
    s_scrollview.center =self.view.center;
    
    _scrollview =[[MMScroviewTool alloc]initWithFrame:CGRectMake(0, 0, scrollX, scrollY) datasource:self.datasource];
    _scrollview.delegate =self;
    _scrollview.contentSize =CGSizeMake(scrollX*self.datasource.count, 0);
    _scrollview.contentOffset =CGPointMake(0, 0);
    _scrollview.layer.cornerRadius =10;
    _scrollview.layer.masksToBounds =YES;
    _scrollview.showsHorizontalScrollIndicator =NO;
    _scrollview.center =_scrollview.center;
    [s_scrollview addSubview:_scrollview];
    [self.view addSubview:s_scrollview];
    
    CGFloat pageW = 100.;
    CGFloat pageH = 30.;
    
    UIView *shadow =[[UIView alloc]initWithFrame:CGRectMake(0, scrollY-30, scrollX, 30)];
    shadow.backgroundColor =[[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    _page = [[UIPageControl alloc]initWithFrame:CGRectMake(scrollX/2-pageW/2, 0, pageW, pageH)];
    [_page setBackgroundColor:[UIColor clearColor]];
    _page.numberOfPages =self.datasource.count;
    _page.pageIndicatorTintColor =[UIColor whiteColor];
    _page.currentPageIndicatorTintColor =[UIColor orangeColor];
    _page.currentPage = 0;
    
    [shadow addSubview:_page];
    [s_scrollview addSubview:shadow];
  
    _timer =[NSTimer scheduledTimerWithTimeInterval:3.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [UIView animateWithDuration:1 animations:^{
            _scrollview.contentOffset =CGPointMake(_scrollview.contentOffset.x+scrollX, 0);
            if (_scrollview.contentOffset.x>= _scrollview.contentSize.width) {
                _scrollview.contentOffset =CGPointMake(0, 0);
            }
        }];

    }];
}


-(NSArray *)datasource{
    if (!_datasource) {
        _datasource =[[NSArray alloc]init];
        _datasource =@[@"01.jpg",@"02.jpg",@"03.jpg"];
//        _datasource =@[@"03.jpg",@"01.jpg",@"02.jpg",@"03.jpg",@"01.jpg"];

    }
    return _datasource;
}
#pragma scroview delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat w =_scrollview.contentOffset.x;
    _page.currentPage = w/scrollView.bounds.size.width;

}

-(void)tap_action:(NSInteger)index{
    NSLog(@"%ld",index);
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_timer setFireDate:[NSDate distantFuture]];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [_timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:2.0]];
}
@end
