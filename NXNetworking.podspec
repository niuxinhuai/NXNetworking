
Pod::Spec.new do |s|
  s.name             = 'NXNetworking'
  s.version          = '0.2.0'
  s.summary          = '简介'

  s.description      = '芳芳小仙女'

  s.homepage         = 'https://github.com/niuxinhuai/NXNetworking'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'niuxinhuai' => '1242537720@qq.com' }
  s.source           = { :git => 'https://github.com/niuxinhuai/NXNetworking.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'NXNetworking/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NXNetworking' => ['NXNetworking/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking'
end
