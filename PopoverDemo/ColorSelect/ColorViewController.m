//
//  ColorViewController.m
//  PopoverDemo
//
//  Created by wanglong on 16/7/23.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "UIImage+GetColor.h"
#import "ColorViewController.h"

@interface ColorViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = self.imageView.image.size;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //获得点击的那点
    CGPoint point =[[touches anyObject] locationInView:self.imageView];
    
    //
    UIImage  *image = self.imageView.image;
    UIColor *color = [image pixelColorAtLocation:point];
    
    //block的方式都可以
    //注意block使用时最好判断是否赋值
    if (self.updateColor) {
        self.updateColor(color);
    }
    
    //通知的方式
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"mainColorUpdate" object:color];
}
@end
