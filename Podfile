# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'


def user_app_pods
  
  pod 'IQKeyboardManagerSwift'

  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxAlamofire','~> 4.4.1'
  pod 'ObjectMapper', '~> 3.4'
  pod 'SwiftyJSON', '~> 4.0'
  
  pod 'SwiftGifOrigin', '~> 1.7.0'
  
  
end
  
  
target 'UserApp' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  # pods
  user_app_pods

  # Pods for UserApp

  target 'UserAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'UserAppUITests' do
    inherit! :search_paths
    # Pods for testing
    user_app_pods
  end

end
