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
    
    NSLog(@"%s",__func__);
    [WSTransitionManager setTransitionViews:@[self.imgBtn, _oneView, _twoView, _label1, _label2] withNav:self.navigationController];

    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    NSLog(@"%s",__func__);
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    NSLog(@"%s",__func__);
}





@end
