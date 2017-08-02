#
# Be sure to run `pod lib lint AdobeSign.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AdobeSign'
  s.version          = '1.0.0'
  s.summary          = 'A Swift SDK for Adobe Sign.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This CocoaPod facilitates the integration of iOS apps with Adobe Sign by handling the OAuth process and REST calls with Adobe's servers.
                       DESC

  s.homepage         = 'https://github.com/elliottbolzan/AdobeSign'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Elliott Bolzan' => 'elliottbolzan@gmail.com' }
  s.source           = { :git => 'https://github.com/elliottbolzan/AdobeSign.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'AdobeSign/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AdobeSign' => ['AdobeSign/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire'
  s.dependency 'SwiftyJSON'
  s.dependency 'KeychainSwift'

end
