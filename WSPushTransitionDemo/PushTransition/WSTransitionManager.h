//
//  WSTransitionManager.h
//  WSPushTransitionDemo
//
//  Created by wackosix on 16/7/5.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSTransitionManager : NSObject <UINavigationControllerDelegate>

+ (instancetype)setTransitionViews:(NSArray <UIView*> *) views withNav:(UINavigationController *)nav;
+ (instancetype)setRevertTransitionView:(NSArray <UIView*> *)views withNav:(UINavigationController *)nav;

@end
