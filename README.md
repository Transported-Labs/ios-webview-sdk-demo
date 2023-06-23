# WebViewDemo

Demo-project for WebViewSDK to use camera torch from page loaded to WKWebView.

## Usage
1. Clone ios-webview-sdk-demo to the local directory:
```
ios-webview-sdk-demo
```
2. Place **WebViewSDK.framework** inside WebViewDemo/lib folder.
3. Open demo-project file WebViewDemo.xcodeproj from ios-webview-sdk-demo in XCode 14.3+:
4. Run demo-project in XCode.
5. If you need to build project and make ipa-file manually, use the following commands:
```
xcodebuild archive -project WebViewDemo.xcodeproj -scheme WebVewDemo -configuration Release -archivePath ./build/WebVewDemoRelease.xcarchive
xcodebuild -exportArchive -archivePath ./build/WebVewDemoRelease.xcarchive -exportPath ./build/output -exportOptionsPlist ./WebViewDemo/ExportOptions.plist
```
## Sample of HTML-file
Please find the sample HTML-file in assets of the demo project: [index.html](https://github.com/Transported-Labs/ios-webview-sdk-demo/blob/main/WebViewDemo/Resources/index.html)
