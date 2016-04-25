platform :ios, '9.0'
use_frameworks!


def testing_pods
    pod 'Quick', '0.9.0'
    pod 'Nimble', '3.2.0'
end

def app_pods
    pod 'RxSwift', '2.4'
    pod 'RxCocoa', '2.4'
    pod 'Alamofire', '3.3.1'
    pod 'AlamofireObjectMapper', '3.0'
    pod 'ObjectMapper', '1.2'
    pod 'AlamofireImage', '2.4'
end

target 'RecipeBook' do
    app_pods
    pod 'AlamofireNetworkActivityIndicator', '1.0.1'
end

target 'RecipeBookTests' do
    testing_pods
    app_pods
end

target 'RecipeBookUITests' do
    testing_pods
end

