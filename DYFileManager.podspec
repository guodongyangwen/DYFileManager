Pod::Spec.new do |s|

  s.name             = 'DYFileManager'                           #项目名称
  s.version          = '1.0.1'                                    #当前版本
  s.summary          = 'a file manager library'                     #简要信息
  #项目描述
  s.description      = <<-DESC
 a powerful File Manager library.
                       DESC

  s.homepage         = 'http://www.jianshu.com/u/d1a569b086e4'                                  #主页
  s.license          = 'MIT'                                                                   #开源协议
  s.author           = { 'guodongyang' => 'guodongyangw@163.com' }                             #作者信息
  s.source           = { :git => 'https://github.com/guodongyangwen/DYFileManager.git', :tag => "1.0.1" }   #项目git地址（注：必须是http或者https，不然验证不通过）
  
  s.ios.deployment_target = '7.0'                                                              #部署平台
  s.requires_arc = true                                                                       #是否需要arc

  s.source_files = 'DYFileManager/*'                                               #项目源代码路径

   s.public_header_files = 'DYFileManager/*.h'                                                 #项目头文件路径
   #s.frameworks = 'UIKit'                                                                       #引用的框架
  # s.dependency 'AFNetworking', '~> 2.3'                                                       #依赖的第三方库
end
