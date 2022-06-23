Pod::Spec.new do |spec|

  spec.name         = "HLLoadingView"
  spec.version      = "1.0.3"
  spec.summary      = "对JHUD封装"

  # 描述
  spec.description  = <<-DESC
  对JHUD封装，作为页面的遮罩层。
  DESC

  # 项目主页
  spec.homepage     = "https://github.com/huangchangweng/HLLoadingView"

  # 开源协议
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  # 作者
  spec.author             = { "黄常翁" => "599139419@qq.com" }
  
  # 支持平台
  spec.platform     = :ios, "9.0"

  # git仓库，tag
  spec.source       = { :git => "https://github.com/huangchangweng/HLLoadingView.git", :tag => spec.version.to_s }
  
  spec.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }

  # 资源路径
  spec.source_files = "HLLoadingView/HLLoadingView/*.{h,m}"
  
  # 资源文件目录，可以在此目录下存放图片、xib等资源，可以使用通配符或者{png,jpg,xib}这样的方式来指定文件类型
  spec.resource     = "HLLoadingView/HLLoadingView/HLLoadingView.bundle"

  # 依赖系统库
  spec.frameworks   = "UIKit"

  # 依赖第三方库
  spec.dependency "JHUD", "0.3.0"

end
