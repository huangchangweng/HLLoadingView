//
//  ViewController.m
//  HLLoadingView
//
//  Created by JJB_iOS on 2022/5/27.
//

#import "ViewController.h"
#import "HLLoadingView.h"

@interface ViewController ()
@property (nonatomic, strong) HLLoadingView *loadingView;
@end

@implementation ViewController

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
        // 3选1
        // 加载成功
//        [self.loadingView hide];
        // 加载失败
        [self.loadingView showFailureAtView:self.view];
//        [self.loadingView showErrorAtView:self.view image:nil message:@"我是自定义提示"];
    });
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.loadingView.frame = self.view.bounds;
}


@end
