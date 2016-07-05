//
//  SecondViewController.m
//  WSPushTransitionDemo
//
//  Created by wackosix on 16/6/29.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIView *oneView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transition.transition.toViews = @[self.AcceptBtn, _oneView, _twoView];
}




@end
