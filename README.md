# HLLoadingView
对JHUD封装，作为页面的遮罩层。

##### 支持使用CocoaPods引入, Podfile文件中添加:

``` objc
pod 'HLLoadingView', '1.0.1'
```
# Demonstration
![image](https://github.com/huangchangweng/HLLoadingView/blob/main/QQ20220610-113300.gif)

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
如果想全局替换HLLoadingView的图片资源，可以在工程中新建一个名字为`HLLoadingView.bundle`的bundle，参照pod中`HLLoadingView.bundle`为图片资源命名。HLLoadingView会优先加载当前工程中的图片资源。

# Requirements

iOS 9.0 +, Xcode 7.0 +

# Dependency
    
- "JHUD", "0.3.0"

# Version
    
* 1.0.2 :

  修改封装逻辑
    
* 1.0.1 :

  修改图片资源加载问题
    
* 1.0.0 :

  完成HLLoadingView基础搭建

# License
HLLoadingView is available under the MIT license. See the LICENSE file for more info.
