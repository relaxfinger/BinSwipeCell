Pod::Spec.new do |spec|
  #工程名称
  spec.name             = "BinSwipeCell"
  #版本号 spec.source中引用了该信息作为github上release的版本号
  spec.version          = "1.0.2"

  #简单描述
  spec.summary          = "为SWTableViewCell 添加了左右间距功能 适配了iOS14"
  #详细描述
  spec.description      = <<-DESC
                        - 项目源于SWTableViewCell.
                        - 为SWTableViewCell 添加了左右间距功能 适配了iOS14.
                        DESC

  #与项目相关的首页
  spec.homepage         = "https://github.com/iBinbro/BinSwipeCell"
  #授权文件类型和路径 这里指向更目录下的LICENCE文件
  spec.license          = { :type => "MIT", :file => "LICENCE" }
  spec.author           = { "iBinBro" => "812117956@qq.com" }
  spec.social_media_url = "https://www.binsama.com"
  spec.platform         = :ios, "8.0"
  spec.source           = { :git => "https://github.com/iBinbro/BinSwipeCell.git", :tag => "#{spec.version}" }
  spec.source_files     = "Classes/**/*.{h,c,m,mm}"
  spec.frameworks       = [ "Foundation", "UIKit"]
  #spec.libraries        = [ "z", "sqlite3" ]
  spec.requires_arc     = true
  #spec.compiler_flags   = "-Wno-unsupported-availability-guard -Wno-strict-prototypes"
  #头文件
  spec.public_header_files = [ "Classes/*.h", "Classes/SWTableViewCell/*.h"]
end