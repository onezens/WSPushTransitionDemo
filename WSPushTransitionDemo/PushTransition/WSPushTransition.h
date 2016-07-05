//
//  WSPushTransition.h
//  WSPushTransitionDemo
//
//  Created by wackosix on 16/6/29.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSPushTransitionInfo : NSObject

@property (nonatomic, weak) UIView *fromView;
@property (nonatomic, weak) UIView *toView;

@property (nonatomic, strong) NSArray <UIView *> *fromViews;
@property (nonatomic, strong) NSArray <UIView *> *toViews;

@end

@interface WSPushTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) NSArray<WSPushTransitionInfo *> *transitionInfos;
@property (nonatomic, strong) WSPushTransitionInfo *transition;

@end
