//
//  ViewController.m
//  PopoverDemo
//
//  Created by wanglong on 16/7/23.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "ViewController.h"
#import "MenuViewController.h"

@interface ViewController ()
/** popVc */
@property(nonatomic,strong) UIPopoverPresentationController *popVc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)controllerClick:(UIBarButtonItem *)sender {
}
- (IBAction)testClick:(UIBarButtonItem *)sender {
    MenuViewController *contnetVc = [[MenuViewController alloc] init];
    contnetVc.modalPresentationStyle = UIModalPresentationPopover;
    
    
    //设置popoverPresentationController的sourceRect和sourceView属性
    contnetVc.popoverPresentationController.barButtonItem = sender;
    contnetVc.popoverPresentationController.permittedArrowDirections = UIMenuControllerArrowUp;
    
    [self presentViewController:contnetVc animated:YES completion:nil];
    
}
- (IBAction)selectColor:(UIButton *)sender {
}
- (IBAction)ios8Click:(UIButton *)sender {
}

@end
