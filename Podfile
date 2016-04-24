platform :ios, '9.0'
use_frameworks!

target 'RecipeBook' do
    pod 'RxSwift', '2.4'
    pod 'RxCocoa', '2.4'
    pod 'Alamofire', '3.3.1'
    pod 'AlamofireNetworkActivityIndicator', '1.0.1'
    pod 'AlamofireObjectMapper', '3.0'
    pod 'ObjectMapper', '1.2'
end

def testing_pods
    pod 'Quick', '0.9.0'
    pod 'Nimble', '3.2.0'
    pod 'Alamofire', '3.3.1'
end

target 'RecipeBookTests' do
    testing_pods
end

target 'RecipeBookUITests' do
    testing_pods
end

