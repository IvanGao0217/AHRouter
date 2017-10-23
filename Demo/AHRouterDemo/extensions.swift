//
//  extensions.swift
//  AHRouter
//
//  Created by IvanGao on 10/17/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

import Foundation
import UIKit


func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
    if let nav = base as? UINavigationController {
        return topViewController(nav.visibleViewController)
    }
    if let tab = base as? UITabBarController {
        if let selected = tab.selectedViewController {
            return topViewController(selected)
        }
    }
    if let presented = base?.presentedViewController {
        return topViewController(presented)
    }
    return base
}
