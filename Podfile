# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'JazHotels' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for JazHotels
  pod 'Kingfisher', '~> 4.0'
  pod 'Alamofire'
  pod 'NVActivityIndicatorView'
  pod 'PullToRefreshKit'
  pod 'SkyFloatingLabelTextField', '~> 3.0'
  pod 'SwifterSwift'
  pod 'BSKeyboardControls', '~> 2.2'
  pod 'SCLAlertView'
  pod 'SIAlertView'
  pod 'TTSegmentedControl'
  pod 'ImageSlideshow', '~> 1.6'
  pod 'ImageSlideshow/Kingfisher'
  pod 'Cosmos', '~> 15.0'
  #pod 'Segmentio', '~> 3.0'
  pod 'XLPagerTabStrip', '~> 8.0'
  pod 'iOSDropDown'
  pod 'IQKeyboardManagerSwift'
  pod 'DatePickerDialog'
  pod 'SVProgressHUD'
  pod 'SideMenu'

  post_install do |installer|
      installer.pods_project.build_configurations.each do |config|
          config.build_settings.delete('CODE_SIGNING_ALLOWED')
          config.build_settings.delete('CODE_SIGNING_REQUIRED')
      end
  end




end
