//
//  MMScroviewTool.h
//  MMScroviewDemo
//
//  Created by yuchen_Mac on 2017/8/18.
//  Copyright © 2017年 yc. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ScrollviewAction <NSObject>
-(void)tap_action:(NSInteger)index;
@end

@interface MMScroviewTool : UIScrollView

-(instancetype)initWithFrame:(CGRect)frame datasource:(NSArray *)datasource;
@property(nonatomic ,strong)NSArray *datasource;

@property(nonatomic ,weak) id<ScrollviewAction>dele;

@end
