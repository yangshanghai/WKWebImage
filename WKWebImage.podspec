#WKWebImage.podspec
Pod::Spec.new do |s|
  s.name         = "WKWebImage"
  s.version      = "1.1.1"
  s.summary      = "一行代码实现UIImageView的异步加载、缓存图片"
  s.homepage     = "https://github.com/WelkinXie/WKWebImage"
  s.license      = 'MIT'
  s.author       = { "Welkin Xie" => "welkin995@126.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/WelkinXie/WKWebImage.git", :tag => s.version, :commit => "d98835afb6fa8e865eba22239beedd11483e5d19"}
  s.source_files  = 'WKWebImage/WKWebImage/*.{h,m}'
  s.requires_arc = true
end