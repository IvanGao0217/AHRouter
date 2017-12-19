//
//  AHRouterManager.swift
//  AHRouterDemo
//
//  Created by IvanGao on 2017/10/23.
//  Copyright © 2017年 IvanGao. All rights reserved.
//

import Foundation
import AHRouter

class AHRouterManager {
    static func startRegister() {
        AHRouterRegister<BViewController>.register(scheme: "wealoha", host: "qwe")
        AHRouterRegister<AViewController>.register(scheme: "wealoha", host: "qweasd")
    }
    
    static func shouldHandled(urlStr: String) -> Bool {
        return AHRouteMap.shared.shouldMatch(urlStr: urlStr)
    }
}
