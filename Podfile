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
    pod 'ObjectMapper', '1.1.5'
    pod 'AlamofireImage', '2.4'
    pod 'RealmSwift', '0.98.8'
    pod 'RealmMapper', '1.0.3'
end

target 'RecipeBook' do
    app_pods
    pod 'AlamofireNetworkActivityIndicator', '1.0.1'
end

target 'RecipeBookTests' do
    testing_pods
    pod 'Alamofire', '3.3.1'

end

target 'RecipeBookUITests' do
    testing_pods
end

