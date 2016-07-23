//
//  ViewController.m
//  PopoverDemo
//
//  Created by wanglong on 16/7/23.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "ViewController.h"
#import "MenuViewController.h"
#import "ColorViewController.h"
#import "OneViewController.h"

#import "IOS8WarningViewController.h"

@interface ViewController ()
/** popVc */
@property(nonatomic,strong) MenuViewController *contnetVc ;
/** nav */
@property(nonatomic,strong) UINavigationController *nav;
/** colorVc */
@property(nonatomic,strong)ColorViewController *colorVc;
/** iosVc */
@property(nonatomic,strong)IOS8WarningViewController *iosVc;

@property (weak, nonatomic) IBOutlet UIButton *warningBtn;

@end

@implementation ViewController

-(IOS8WarningViewController *)iosVc
{
    if (_iosVc == nil) {
        _iosVc = [[IOS8WarningViewController alloc] init];
        _iosVc.modalPresentationStyle = UIModalPresentationPopover;
        
 

#warning ---设置次这2个属性时 第二次调用会清空   以后不要在此设置 在调用的时候设置
//        _iosVc.popoverPresentationController.sourceView = self.view;
//        _iosVc.popoverPresentationController.sourceRect = self.warningBtn.frame;
        
//        _iosVc.popoverPresentationController.barButtonItem
#warning  end
    }
    return _iosVc;
}
- (ColorViewController *)colorVc
{
    if (_colorVc == nil) {
       __block ColorViewController *colorVc = [[ColorViewController alloc] init];
        colorVc.modalPresentationStyle = UIModalPresentationPopover;
        
//        __weak typeof(self) _wealSelf = self;
        UpdateColor updateColor = ^(UIColor * color){
            self.view.backgroundColor  = color;
            [colorVc dismissViewControllerAnimated:YES completion:nil];
            
        };
        colorVc.updateColor = updateColor;
        _colorVc = colorVc;
    }
    return _colorVc;
}
- (UINavigationController *)nav
{
    if (_nav == nil) {
        OneViewController *oneVc =  [[OneViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:oneVc];
        oneVc.view.backgroundColor = [UIColor redColor];
        nav.modalPresentationStyle = UIModalPresentationPopover;
        nav.popoverPresentationController.backgroundColor = [UIColor whiteColor];
        _nav = nav;
    }
    return _nav;
}
- (MenuViewController *)contnetVc
{
    if (_contnetVc == nil) {
        MenuViewController *contnetVc = [[MenuViewController alloc] init];
        contnetVc.modalPresentationStyle = UIModalPresentationPopover;
        _contnetVc = contnetVc;
    }
    return _contnetVc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainColorUpdate:) name:@"mainColorUpdate" object:nil];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)mainColorUpdate:(NSNotification *)note
{
    UIColor *color =  (UIColor *)note.object;
    
    self.view.backgroundColor = color;
    
}
- (IBAction)controllerClick:(UIBarButtonItem *)sender {

    self.nav.popoverPresentationController.barButtonItem = sender;
    
    [self presentViewController:self.nav animated:YES completion:nil];
    
}
- (IBAction)testClick:(UIBarButtonItem *)sender {
       //设置popoverPresentationController的sourceRect和sourceView属性
    self.contnetVc.popoverPresentationController.barButtonItem = sender;
    self.contnetVc.popoverPresentationController.permittedArrowDirections = UIMenuControllerArrowUp;
    [self presentViewController:self.contnetVc animated:YES completion:nil];
    
}
- (IBAction)selectColor:(UIButton *)sender {
    
    self.colorVc.popoverPresentationController.sourceRect = sender.bounds;
    self.colorVc.popoverPresentationController.sourceView = sender;
    self.colorVc.popoverPresentationController.backgroundColor = [UIColor whiteColor];

    [self presentViewController:self.colorVc animated:YES completion:nil];
}
- (IBAction)ios8Click:(UIButton *)sender {
    
    self.iosVc.popoverPresentationController.sourceView = sender;
        self.iosVc.popoverPresentationController.sourceRect = sender.bounds;
    [self presentViewController:self.iosVc animated:YES completion:nil];
}

@end
