//
//  BViewController.swift
//  AHRouter
//
//  Created by IvanGao on 10/17/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

import Foundation
import UIKit
import AHRouter

class BViewController: UIViewController {
    static func showBViewController() -> Bool {
        if let viewController = topViewController() {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let bViewController = storyboard.instantiateViewController(withIdentifier: "BViewController")
            viewController.navigationController?.pushViewController(bViewController, animated: true)
            return true
        }
        return false
    }
}

extension BViewController: Routable {
    static func route(content: AHRouteContent) -> Bool {
        if let targetViewController = content.queryDictionary["targetVC"], targetViewController == "B" {
            return BViewController.showBViewController()
        }
        return false
    }
}

