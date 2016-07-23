//
//  ColorViewController.h
//  PopoverDemo
//
//  Created by wanglong on 16/7/23.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^UpdateColor)(UIColor *);
@interface ColorViewController : UIViewController
/**updateColor*/
@property(nonatomic,copy) UpdateColor updateColor;
@end
