//
//  ViewController.swift
//  WebViewDemo
//
//  Created by Alexander Mokrushin on 28.04.2023.
//

import UIKit
import WebViewSDK

class ViewController: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func navigateButtonPressed(_ sender: Any) {
//        let urlString = "https://www.google.com"
        let urlString = self.urlTextField.text ?? ""
        guard urlString != "" else {
            print("Empty URL is not allowed")
            return
        }
        let sdkController = WebViewController()
//        sdkController.modalPresentationStyle = .fullScreen
        present(sdkController, animated: true) {
            if let url = URL(string: urlString) {
                do {
                    try sdkController.navigateTo(url: url)
                } catch {
                    sdkController.dismiss(animated: true)
                    print(error)
                }
            }
        }
    }
    
    @IBAction func openFileButtonPressed(_ sender: Any) {
        let sdkController = WebViewController()
        present(sdkController, animated: true) {
            // Navigate to local testing page
            if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
                sdkController.navigateToFile(url: url)
            }
        }
    }
}

