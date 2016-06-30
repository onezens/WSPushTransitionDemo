//
//  FirstViewController.m
//  WSPushTransitionDemo
//
//  Created by wackosix on 16/6/29.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "WSPushTransition.h"

@interface FirstViewController ()<UINavigationControllerDelegate>

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
    
}

#pragma mark <UINavigationControllerDelegate>
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    
    if ([toVC isKindOfClass:[SecondViewController class]]) {
        
        SecondViewController *secVC = (SecondViewController *)toVC;
        WSPushTransition *transition = [[WSPushTransition alloc] init];
        secVC.transition = transition;
        
        WSPushTransitionInfo *info = [[WSPushTransitionInfo alloc] init];
        info.fromView = self.imgBtn;
        info.transitionView = self.imgBtn;
        transition.transitionInfos = @[info];
        return transition;
        
    }else {
        return nil;
    }
}


@end
