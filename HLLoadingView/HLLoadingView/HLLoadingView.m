//
//  HLLoadingView.m
//  HLLoadingView
//
//  Created by JJB_iOS on 2022/5/27.
//

#define HLUIColorFromHEX(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kHLIsFullScreen ({\
BOOL isBangsScreen = NO; \
if (@available(iOS 11.0, *)) { \
UIWindow *window = [[UIApplication sharedApplication].windows firstObject]; \
isBangsScreen = window.safeAreaInsets.bottom > 0; \
} \
isBangsScreen; \
})
// Status bar height.
#define kHLStatusBarHeight (kHLIsFullScreen ? 44.f : 20.f)

#import "HLLoadingView.h"

@interface HLLoadingView()
@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, strong) NSArray<UIImage *> *lodingImages;
@property (nonatomic, strong) UIImage *failureImage;
@property (nonatomic, strong) UIImage *customErrorImage;
@property (nonatomic, strong) UIImage *backImage;
@end

@implementation HLLoadingView

- (instancetype)initWithFrame:(CGRect)frame {
    
    NSMutableArray *lodingImages = [NSMutableArray array];
    for (int index = 1; index<=3; index++) {
        UIImage *lodingImage = [HLLoadingView budleImageWithName:[NSString stringWithFormat:@"loading_%d.png",index]];
        [lodingImages addObject:lodingImage];
    }
    
    UIImage *failureImage = [HLLoadingView budleImageWithName:@"no_notwork"];
    UIImage *customErrorImage = [HLLoadingView budleImageWithName:@"server_error"];
    UIImage *backImage = [HLLoadingView budleImageWithName:@"nav_back_black"];
    
    return [self initWithFrame:frame
                  lodingImages:lodingImages
                  failureImage:failureImage
              customErrorImage:customErrorImage
                     backImage:backImage];
}

- (instancetype)initWithFrame:(CGRect)frame
                 lodingImages:(NSArray<UIImage *> *)lodingImages
                 failureImage:(UIImage *)failureImage
             customErrorImage:(UIImage *)customErrorImage
                    backImage:(UIImage *)backImage;
{
    if (self = [super initWithFrame:frame]) {
        self.lodingImages = lodingImages;
        self.failureImage = failureImage;
        self.customErrorImage = customErrorImage;
        self.backImage = backImage;
        
        self.backgroundColor = [UIColor whiteColor];
        self.messageLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14.f];
        // refreshButton
        UIColor *bColor = HLUIColorFromHEX(0x4181FE);
        self.refreshButton.layer.borderColor = bColor.CGColor;
        self.refreshButton.layer.cornerRadius = 17.5f;
        self.refreshButton.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
        [self.refreshButton setTitle:@"重试" forState:UIControlStateNormal];
        [self.refreshButton setTitleColor:bColor forState:UIControlStateNormal];
        // backButton
        [self.backButton setImage:backImage forState:UIControlStateNormal];
        [self addSubview:self.backButton];
    }
    return self;
}

#pragma mark - Private Method

+ (UIImage *)budleImageWithName:(NSString *)imageName
{
    NSString *bundleName = @"HLLoadingView";
    // 静态库 url 的获取
    NSURL *url = [[NSBundle mainBundle] URLForResource:bundleName withExtension:@"bundle"];
    if (!url) {
        // 动态库 url 的获取
        url = [[NSBundle bundleForClass:[self class]] URLForResource:bundleName withExtension:@"bundle"];
    }
    NSBundle *bundle = [NSBundle bundleWithURL:url];
    UIImage *image = [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
    return image;
}

#pragma mark - Public Method

- (void)showLoadingAtView:(UIView *)view
{
    self.indicatorViewSize = CGSizeMake(50, 10);
    self.customAnimationImages = self.lodingImages;
    self.messageLabel.text = nil;
    [self showAtView:view hudType:JHUDLoadingTypeCustomAnimations];
}

- (void)showFailureAtView:(UIView *)view
{
    self.indicatorViewSize = CGSizeMake(280, 140);
    self.messageLabel.text = @"网络好像有点问题哟!";
    self.customImage = self.failureImage;

    [self showAtView:view hudType:JHUDLoadingTypeFailure];
}

- (void)showErrorAtView:(UIView *)view
                  image:(UIImage *)image
                message:(NSString *)message
{
    if (!image) {
        image = self.customErrorImage;
    }
    self.indicatorViewSize = CGSizeMake(280, 140);
    self.messageLabel.text = message;
    [self.refreshButton setTitle:@"重试" forState:UIControlStateNormal];
    self.customImage = image;

    [self showAtView:view hudType:JHUDLoadingTypeFailure];
}

#pragma mark - Response Event

- (void)backAction
{
    if (self.backButtonClickedBlock) {
        self.backButtonClickedBlock();
    }
}

#pragma mark - Getter

- (UIButton *)backButton {
    if (!_backButton) {
        UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton sizeToFit];
        [backButton addTarget:self
                       action:@selector(backAction)
             forControlEvents:UIControlEventTouchUpInside];
        backButton.frame = CGRectMake(0, kHLStatusBarHeight, 44, 44);
        backButton.hidden = YES;
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        _backButton = backButton;
    }
    return _backButton;
}

- (void)setBackButtonClickedBlock:(void (^)(void))backButtonClickedBlock {
    _backButtonClickedBlock = backButtonClickedBlock;
    _backButton.hidden = _backButtonClickedBlock==nil;
}

@end
