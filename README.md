# WebViewDemo

Demo-project for WebViewSDK to access camera from page loaded to WKWebView. Is used for CUE Live Lightshow 2.0.

## Usage
1. Clone ios-webview-sdk-demo to the local directory:
```
git clone https://github.com/Transported-Labs/ios-webview-sdk-demo
```
2. Change the current directory to ios-webview-sdk-demo:
```
cd ios-webview-sdk-demo
```
3. Install Podfile:
```
pod install
```
4. Open workspace file **WebViewDemo.xcworkspace** (**not** WebViewDemo.xcodeproj) in XCode 14.3+:
5. Build and run demo-project in XCode.
6. If you need to build project manually, use the following command:
```
xcodebuild archive -workspace WebViewDemo.xcworkspace -scheme WebVewDemo -configuration Release -archivePath ./build/WebVewDemoRelease.xcarchive
```
## Integration

Simply execute the following code:

```swift
    @IBAction func navigateButtonPressed(_ sender: Any) {
        let urlString = "<your URL from CUE>"
        if let url = URL(string: urlString) {
            do {
                try sdkController.navigateTo(url: url)
                sdkController.modalPresentationStyle = .fullScreen
                present(sdkController, animated: true)
            } catch InvalidUrlError.runtimeError(let message){
                print("URL is not valid: \(message)")
            } catch {
                // Any other error occured
                print(error.localizedDescription)
            }
        }
    }
```
## Pre-fetch

To pre-fetch lightshow resources is very similar to navigation, but we should keep sdkController hidden and add to URL preload parameter.
Just execute the following code:

```swift
    @IBAction func prefetchButtonPressed(_ sender: Any) {
        let urlString = "<your URL from CUE>"
        // Add parameter to original URL
        if let url = URL(string: "\(urlString)&preload=true") {
            do {
                try sdkController.navigateTo(url: url) {progress in
                    // You can get progress from 0 to 100 during the pre-fetch process
                    self.prefetchButton.setTitle("Fetched:\(progress)%", for: .normal)
                }
            } catch InvalidUrlError.runtimeError(let message){
                print("URL is not valid: \(message)")
            } catch {
                // Any other error occured
                print(error.localizedDescription)
            }
        }
    }
```
