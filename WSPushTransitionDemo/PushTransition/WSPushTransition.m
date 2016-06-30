//
//  WSPushTransition.m
//  WSPushTransitionDemo
//
//  Created by wackosix on 16/6/29.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSPushTransition.h"

@interface WSPushTransitionInfo ()
@property (nonatomic, strong) UIView *snapView;

@end
@implementation WSPushTransitionInfo @end

@implementation WSPushTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.6f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    
    
    for (WSPushTransitionInfo *info in self.transitionInfos) {
        UIView *snapView = [info.transitionView snapshotViewAfterScreenUpdates:false];
        snapView.frame = [containerView convertRect:info.transitionView.frame fromView:info.transitionView.superview];
        info.transitionView.hidden = true;
        info.toView.hidden = true;
        [containerView addSubview:toVC.view];
        [containerView addSubview:snapView];
        info.snapView = snapView;
    }
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:1.0f options:UIViewAnimationOptionCurveLinear animations:^{
        
        [containerView layoutIfNeeded];
        toVC.view.alpha = 1.0;
//        snapView.frame = [containerView convertRect:self.toView.frame fromView:self.toView.superview];
        
        for (WSPushTransitionInfo *info in self.transitionInfos) {
            info.snapView.frame = [containerView convertRect:info.toView.frame fromView:info.toView.superview];
        }

        
    } completion:^(BOOL finished) {
        
        for (WSPushTransitionInfo *info in self.transitionInfos) {
            info.toView.hidden = false;
            info.fromView.hidden = false;
            [info.snapView removeFromSuperview];

        }
        //告诉系统动画结束
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}


- (void)animationEnded:(BOOL) transitionCompleted {
    
}

@end
