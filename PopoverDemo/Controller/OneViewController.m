//
//  OneViewController.m
//  PopoverDemo
//
//  Created by wanglong on 16/7/23.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"OneVc";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:nil action:nil];
    UIButton *twoVc = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    [twoVc setTitle:@"调到第二个Vc" forState:UIControlStateNormal];
    [twoVc addTarget:self action:@selector(click2TwoVc) forControlEvents:UIControlEventTouchUpInside];
    twoVc.backgroundColor = [UIColor redColor];
    twoVc.frame = CGRectMake(100, 100, 100, 100);
//    [twoVc sizeToFit];
    [self.view addSubview:twoVc];
    
    
}

- (void)click2TwoVc
{
    TwoViewController *twoVc = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:twoVc animated:YES];
}

@end
