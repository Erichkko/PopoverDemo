

//
//  MenuViewController.m
//  PopoverDemo
//
//  Created by wanglong on 16/7/23.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [popVc setPopoverContentSize:CGSizeMake(120, 44 *3)];
    [self setPreferredContentSize:CGSizeMake(120, 44 *3)];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"菜单--%zd",indexPath.row];
    return cell;
}
@end