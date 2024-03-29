#
# Be sure to run `pod lib lint LWZSCategoryAndTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LWZSCategoryAndTool'
  s.version          = '0.1.5'
  s.summary          = 'CategoryAndTool Packages'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'CategoryAndTool Packages'

  s.homepage         = 'https://github.com/LYFGH/LWZSCategoryAndTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LYFGH' => 'yafei_v5@163.com' }
  s.source           = { :git => 'https://github.com/LYFGH/LWZSCategoryAndTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.3'

#  s.source_files = 'LWZSCategoryAndTool/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LWZSCategoryAndTool' => ['LWZSCategoryAndTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire'
  s.dependency 'ReachabilitySwift'
  s.dependency 'HandyJSON'
  
  #UIKit
  s.subspec 'UIColor' do |color|
      color.source_files = 'LWZSCategoryAndTool/Classes/LWZUIKit/UIColor/*.{swift}'
  end
  
  s.subspec 'UIFont' do |font|
      color.source_files = 'LWZSCategoryAndTool/Classes/LWZUIKit/UIFont/*.{swift}'
      font.resource = 'LWZSCategoryAndTool/Classes/LWZUIKit/UIFont/Resources/UIFont.bundle'
  end
  
  s.subspec 'UIGestureRecognizer' do |gestureRecognizer|
      color.source_files = 'LWZSCategoryAndTool/Classes/LWZUIKit/UIGestureRecognizer/*.{swift}'
  end
  
  s.subspec 'UIScrollView' do |scrollView|
      color.source_files = 'LWZSCategoryAndTool/Classes/LWZUIKit/UIScrollView/*.{swift}'
  end
  
  s.subspec 'UITextField' do |textField|
      color.source_files = 'LWZSCategoryAndTool/Classes/LWZUIKit/UITextField/*.{swift}'
  end
  
  s.subspec 'UITextview' do |textview|
      color.source_files = 'LWZSCategoryAndTool/Classes/LWZUIKit/UITextview/*.{swift}'
  end
  
  s.subspec 'UIView' do |view|
      color.source_files = 'LWZSCategoryAndTool/Classes/LWZUIKit/UIView/*.{swift}'
  end
  
end
