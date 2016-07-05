//
//  SecondViewController.m
//  WSPushTransitionDemo
//
//  Created by wackosix on 16/6/29.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
#import "WSPushTransition.h"

@interface SecondViewController ()<UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIView *oneView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transition.toViews = @[self.AcceptBtn, _oneView, _twoView];
    
    self.navigationController.delegate = self;
}

#pragma mark <UINavigationControllerDelegate>
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    if ([toVC isKindOfClass:[FirstViewController class]]) {
        
        self.transition.isPop = true;
        return self.transition;
        
    }else{
        return nil;
    }
}





@end
