//
//  HLLoadingView.h
//  HLLoadingView
//
//  Created by JJB_iOS on 2022/5/27.
//

#import <JHUD/JHUD.h>

@interface HLLoadingView : JHUD

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
