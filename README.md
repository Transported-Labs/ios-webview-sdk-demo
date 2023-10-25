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
## Sample of HTML-file
Please find the sample HTML-file in assets of the demo project: [index.html](https://github.com/Transported-Labs/ios-webview-sdk-demo/blob/main/WebViewDemo/Resources/index.html)
