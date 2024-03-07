//
//  ViewController.swift
//  WebViewDemo
//
//  Created by Alexander Mokrushin on 28.04.2023.
//

import UIKit
import WebViewSDK

class ViewController: UIViewController {

    lazy var sdkController = WebViewController()
    lazy var scannerViewController = ScannerViewController()
    
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var prefetchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func scanQRButtonPressed(_ sender: Any) {
        present(scannerViewController, animated: true)
        do {
            try scannerViewController.scan {result in
                self.scannerViewController.dismiss(animated: true)
                self.urlTextField.text = result
                if result.contains("https://") {
                    self.navigateButtonPressed(sender)
                }
            }
        } catch {
            self.showToast(message: error.localizedDescription, seconds: 2.0)
        }
    }
    
    @IBAction func prefetchButtonPressed(_ sender: Any) {
        let urlString = self.urlTextField.text ?? ""
        guard urlString != "" else {
            print("Empty URL is not allowed")
            return
        }
        
        if let url = URL(string: "\(urlString)&preload=true") {
            do {
                try sdkController.navigateTo(url: url) {progress in
                    self.prefetchButton.setTitle("Fetched:\(progress)%", for: .normal)
                    self.prefetchButton.invalidateIntrinsicContentSize()
                }
            } catch InvalidUrlError.runtimeError(let message){
                self.showToast(message: message, seconds: 2.0)
            } catch {
                self.showToast(message: error.localizedDescription, seconds: 2.0)
            }
        }
    }
    
    @IBAction func navigateButtonPressed(_ sender: Any) {
//        let urlString = "https://www.google.com"
        let urlString = self.urlTextField.text ?? ""
        guard urlString != "" else {
            print("Empty URL is not allowed")
            return
        }
        
        if let url = URL(string: urlString) {
            do {
                try sdkController.navigateTo(url: url, progressHandler: nil)
                sdkController.modalPresentationStyle = .fullScreen
                present(sdkController, animated: true)
            } catch InvalidUrlError.runtimeError(let message){
                self.showToast(message: message, seconds: 2.0)
            } catch {
                self.showToast(message: error.localizedDescription, seconds: 2.0)
            }
        }
    }
    
    @IBAction func openFileButtonPressed(_ sender: Any) {
        let sdkController = WebViewController()
        sdkController.modalPresentationStyle = .fullScreen
        present(sdkController, animated: true) {
            // Navigate to local testing page
            if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
                sdkController.navigateToFile(url: url)
            }
        }
    }
}

extension UIViewController{

    func showToast(message : String, seconds: Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .systemBackground
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}
