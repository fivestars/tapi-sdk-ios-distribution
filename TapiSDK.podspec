Pod::Spec.new do |s|
  s.name          = 'TapiSDK'
  s.version       = '0.0.2'
  s.summary       = 'The TapiSDK for iOS is a wrapper around the Terminal API for payment processing for Fivestars cPay integrators.'
  s.homepage      = 'http://fivestars.com'
  s.license       = { :type => 'MIT' }
  s.author        = 'Fivestars by SumUp'
  s.source        = { :git => 'https://github.com/fivestars/tapi-sdk-ios-distribution.git', :tag => s.version.to_s }
  s.swift_version = '5.3'
  s.platform = :ios
  s.ios.deployment_target = '13.0'

  s.dependency 'AnyCodable-FlightSchool', '0.6.7'
  s.dependency 'VGSCollectSDK', '1.15.2'

  s.vendored_frameworks = 'TapiSDK.xcframework'
end