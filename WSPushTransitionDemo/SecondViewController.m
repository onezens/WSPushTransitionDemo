//
//  SecondViewController.m
//  WSPushTransitionDemo
//
//  Created by wackosix on 16/6/29.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "SecondViewController.h"
#import "WSTransitionManager.h"

@interface SecondViewController ()<UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UIButton *AcceptBtn;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [WSTransitionManager setRevertTransitionView:@[self.AcceptBtn, _oneView, _twoView, _label1, _label2] withNav:self.navigationController];
    
}




@end
