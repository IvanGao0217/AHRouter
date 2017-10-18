Pod::Spec.new do |s|
  s.name = ‘AHRouter’
  s.version = ‘1.0’
  s.license = 'MIT'
  s.summary = ‘A Simple Router in Swift'
  s.homepage = 'https://github.com/IvanGao0217/AHRouter'
  s.social_media_url = 'https://github.com/IvanGao0217/AHRouter'
  s.authors = ‘Ivan Gao’, { 'Ivan Gao' => ‘Ivangao0217@gmail.com’ }
  s.source = { :git => 'https://github.com/IvanGao0217/AHRouter.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.source_files = 'Source/*.swift'
end
