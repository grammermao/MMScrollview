//
//  MMScroviewTool.m
//  MMScroviewDemo
//
//  Created by yuchen_Mac on 2017/8/18.
//  Copyright © 2017年 yc. All rights reserved.
//

#import "MMScroviewTool.h"

#define SELF_WIDTH self.frame.size.width
#define SELF_HEIGHT self.frame.size.height

#define IMGV_TAG 100

@implementation MMScroviewTool


-(instancetype)initWithFrame:(CGRect)frame datasource:(NSArray *)datasource{
    self =[super initWithFrame:frame];
    if (self) {
        self.scrollEnabled =YES;
        self.pagingEnabled =YES;
        self.datasource =datasource;
        [self init_ui];
    }
    return self;
}

-(void)init_ui{

    for (int i =0; i<self.datasource.count; i++) {
        UIImageView *img_v =[[UIImageView alloc]init];
        img_v.frame =CGRectMake(i*SELF_WIDTH, 0, SELF_WIDTH, SELF_HEIGHT);
        img_v.layer.cornerRadius =10;
        img_v.layer.masksToBounds =YES;
        img_v.tag =i+IMGV_TAG;
        
        UIImage *img =[UIImage imageNamed:self.datasource[i]];
        img_v.image =img;
        
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(on_tap:)];
        
        img_v.userInteractionEnabled =YES;
        [img_v addGestureRecognizer:tap];
        [self addSubview:img_v];
    }
}

-(void)on_tap:(UIImageView *)sender{
    NSLog(@"you taped %ld pic",sender.tag-IMGV_TAG);
    [self.dele  tap_action:sender.tag];
    
}



@end
