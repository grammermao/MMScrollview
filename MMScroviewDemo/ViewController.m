//
//  ViewController.m
//  MMScroviewDemo
//
//  Created by yuchen_Mac on 2017/8/18.
//  Copyright © 2017年 yc. All rights reserved.
//

#import "ViewController.h"
#import "MMScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
}
- (IBAction)showADview:(id)sender {
    MMScrollView *scroll_v =[[MMScrollView alloc]init];
    [self presentViewController:scroll_v animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
