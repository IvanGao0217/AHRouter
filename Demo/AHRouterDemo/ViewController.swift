//
//  ViewController.swift
//  AHRouter
//
//  Created by IvanGao on 10/17/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

import UIKit
import AHRouter

class AViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var startRouteButton: UIButton!
    
    @IBAction func tapped(_ sender: Any) {
        guard let str = self.textField.text else {
            return
        }
        let handled = AHRouterManager.shouldHandled(urlStr: str)
        print(handled)
        self.textField.endEditing(true)
    }
    
    @IBAction func copyTapped(_ sender: Any) {
        guard let button = sender as? UIButton,
        let title = button.titleLabel?.text else {
            return
        }
        UIPasteboard.general.string = title
        self.textField.text = title
    }
    
    @IBAction func cleanTapped(_ sender: Any) {
        self.textField.text = nil
    }
}

extension AViewController: Routable {
    static func route(content: AHRouteContent) -> Bool {
        if let alpha = content.queryDictionary["alpha"], let viewController = topViewController() {
            viewController.view.backgroundColor = viewController.view.backgroundColor?.withAlphaComponent(CGFloat(truncating: NumberFormatter().number(from: alpha) ?? 1))
            return true
        }
        return false
    }
}


