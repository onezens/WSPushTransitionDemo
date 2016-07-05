//
//  FirstViewController.m
//  WSPushTransitionDemo
//
//  Created by wackosix on 16/6/29.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "FirstViewController.h"
#import "WSTransitionManager.h"

@interface FirstViewController ()<UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UIButton *imgBtn;

@end

@implementation FirstViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [WSTransitionManager setTransitionViews:@[self.imgBtn, _oneView, _twoView, _label1, _label2] withNav:self.navigationController];
    
}




@end
