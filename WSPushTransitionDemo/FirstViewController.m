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
@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UIView *twoView;



@end

@implementation FirstViewController


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    //这句代码只能放在viewWillAppear或者viewDidAppear里，否则会出现第二次push不能显示动画的bug
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
        transition.fromViews = @[self.imgBtn, _oneView, _twoView];
        return transition;
        
    }else {
        return nil;
    }
}


@end
