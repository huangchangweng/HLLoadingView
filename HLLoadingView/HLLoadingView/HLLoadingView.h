//
//  HLLoadingView.h
//  HLLoadingView
//
//  Created by JJB_iOS on 2022/5/27.
//

#import <JHUD/JHUD.h>

@interface HLLoadingView : JHUD

@property (nonatomic, strong) NSArray<UIImage *> *lodingImages;
@property (nonatomic, strong) UIImage *failureImage;
@property (nonatomic, strong) UIImage *customErrorImage;
@property (nonatomic, strong) UIImage *backImage;

/**
 *  可选初始化方法
 *  @param frame 位置大小
 *  @param lodingImages 加载中图片数组
 *  @param failureImage 失败图片
 *  @param customErrorImage 自定义错误图片（这里传了，在showErrorAtView:image:message:就可不传了）
 *  @param backImage 返回按钮图片
 */
- (instancetype)initWithFrame:(CGRect)frame
                 lodingImages:(NSArray<UIImage *> *)lodingImages
                 failureImage:(UIImage *)failureImage
             customErrorImage:(UIImage *)customErrorImage
                    backImage:(UIImage *)backImage;

/**
 *  显示加载中的样式
 */
- (void)showLoadingAtView:(UIView *)view;
/**
 *  显示网络问题的样式
 */
- (void)showFailureAtView:(UIView *)view;
/**
 *  显示自定义错误样式
 *  image 自定义错误图片（可不传）
 *  message 自定义错误消息
 */
- (void)showErrorAtView:(UIView *)view
                  image:(UIImage *)image
                message:(NSString *)message;

/// 设置了该block左上角就会显示返回按钮
@property (nonatomic, copy) void(^backButtonClickedBlock)(void);

@end
