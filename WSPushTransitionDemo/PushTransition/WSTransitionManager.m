//
//  WSTransitionManager.m
//  WSPushTransitionDemo
//
//  Created by wackosix on 16/7/5.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSTransitionManager.h"
#import "WSPushTransition.h"

@interface WSTransitionManager ()

@property (nonatomic, strong) NSArray<UIView *> * fromViews;
@property (nonatomic, strong) NSArray<UIView *> * toViews;
@property (nonatomic, strong) WSPushTransition  *transition;

@end

@implementation WSTransitionManager

static id _instance;

- (instancetype)init {
    
    if (self = [super init]) {
        self.transition = [[WSPushTransition alloc] init];
    }
    return self;
}

- (void)setToViews:(NSArray<UIView *> *)toViews {
    
    _toViews = toViews;
    self.transition.toViews = toViews;
}

- (void)setFromViews:(NSArray<UIView *> *)fromViews {
    
    _fromViews = fromViews;
    self.transition.fromViews = fromViews;
}

+ (instancetype)manager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

+ (instancetype)setTransitionViews:(NSArray<UIView *> *)views withNav:(UINavigationController *)nav {
    
    nav.delegate = [self manager];
    [WSTransitionManager manager].fromViews = views;
    return [self manager];
    
}

+ (instancetype)setRevertTransitionView:(NSArray<UIView *> *)views withNav:(UINavigationController *)nav {
    
    nav.delegate = [self manager];
    [WSTransitionManager manager].toViews = views;
    return [self manager];
}

#pragma mark <UINavigationControllerDelegate>
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    
    self.transition.isPop = operation == UINavigationControllerOperationPop;
    return self.transition;
    
}




@end
