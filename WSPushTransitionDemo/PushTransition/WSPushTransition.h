//
//  WSPushTransition.h
//  WSPushTransitionDemo
//
//  Created by wackosix on 16/6/29.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSPushTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) NSArray <UIView *> *fromViews;
@property (nonatomic, strong) NSArray <UIView *> *toViews;
@property (nonatomic, assign) BOOL isPop;

@end
