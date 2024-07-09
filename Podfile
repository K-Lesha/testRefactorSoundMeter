# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'
inhibit_all_warnings!
use_frameworks!

target 'SoundMeter' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SoundMeter
  pod 'GaugeSlider', '~> 1.2.1'
  pod 'DTGradientButton'
  pod 'CleanyModal'
  pod 'MKRingProgressView'
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      if target.name == 'OneSignalNotificationExtension'
        config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
      end
    end
  end
end
