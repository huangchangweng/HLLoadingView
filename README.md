# HLLoadingView
对JHUD封装，作为页面的遮罩层。

##### 支持使用CocoaPods引入, Podfile文件中添加:

``` objc
pod 'HLCategorys', '1.0.0'
```

基本使用方法:<p>

``` objc
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化
    self.loadingView = [[HLLoadingView alloc] initWithFrame:self.view.bounds];
    self.loadingView.JHUDReloadButtonClickedBlock = ^() {
        NSLog(@"在这里可以重新加载");
    };
    
    // 加载中
    [self.loadingView showLoadingAtView:self.view];
  
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 2), dispatch_get_main_queue(), ^{
        // 加载失败
        [self.loadingView showFailureAtView:self.view];
    });
}

// 注意：这里能准确获取到self.view的大小
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.loadingView.frame = self.view.bounds;
}
```

# Requirements

iOS 9.0 +, Xcode 7.0 +

# Version

* 1.0.0 :

  完成HLCategorys基础搭建

# License
HLNetworkManager is available under the MIT license. See the LICENSE file for more info.
