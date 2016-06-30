//
//  SecondViewController.h
//  WSPushTransitionDemo
//
//  Created by wackosix on 16/6/29.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSPushTransition.h"

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *AcceptBtn;
@property (nonatomic, strong) WSPushTransition *transition;

@end
