
# WSPushTransitionDemo

一句代码实现多个空间的自定义push转场动画

## 效果图

![](https://raw.githubusercontent.com/wackosix/WSPushTransitionDemo/master/transition.gif)

## 用法

```
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [WSTransitionManager setTransitionViews:@[self.imgBtn, _oneView, _twoView, _label1, _label2] withNav:self.navigationController];
 
}

```

### 更多push或者modal动画将会持续更新，欢迎star关注