//
//  WSPushTransition.m
//  WSPushTransitionDemo
//
//  Created by wackosix on 16/6/29.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSPushTransition.h"



@implementation WSPushTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.6f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toVC.view];
    
    if (_isPop) {
        [self swapFromAndToView];
    }
    
    NSMutableArray <UIView *> *tempView = [NSMutableArray arrayWithCapacity:self.fromViews.count];
    
    if (self.fromViews.count != self.toViews.count) {
        NSLog(@"跳转的和原先的对应的视图个数不一致");
        return;
    }
    
    for (UIView *view in self.fromViews) {
        
        UIView *snapView = [view snapshotViewAfterScreenUpdates:NO];
        snapView.frame = [containerView convertRect:view.frame fromView:view.superview];
        [containerView addSubview:snapView];
        view.hidden = true;
        [tempView addObject:snapView];
        
    }
    
    NSMutableArray <NSValue *> *toFrame = [NSMutableArray arrayWithCapacity:self.fromViews.count];
    
    for (UIView *view in self.toViews) {
        CGRect rect = [containerView convertRect:view.frame fromView:view.superview];
        view.hidden = true;
        [toFrame addObject:[NSValue valueWithCGRect:rect]];
    }
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:1.0f options:UIViewAnimationOptionCurveLinear animations:^{
        
        toVC.view.alpha = 1.0;
        fromVC.view.alpha = 0.0;
        [tempView enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.frame = toFrame[idx].CGRectValue;
        }];
        
    } completion:^(BOOL finished) {
        
        fromVC.view.alpha = 1.0;
        [self.fromViews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.hidden = self.toViews[idx].hidden = false;
        }];
        [tempView makeObjectsPerformSelector:@selector(removeFromSuperview)];
        if (_isPop) {
            [self swapFromAndToView];
        }
        //告诉系统动画结束
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}

- (void)swapFromAndToView{
    
    NSArray *arrTemp = self.fromViews;
    self.fromViews = self.toViews;
    self.toViews = arrTemp;
}



@end
