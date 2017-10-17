//
//  AHRouterManager.swift
//  AHRouter
//
//  Created by IvanGao on 10/17/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

import Foundation

protocol Routable {
    static func route(content: AHRouteContent) -> Bool
}

class AHRouterManager {
    //App初始化时urlHost的注册
    static func startRegist() {
        AHRouterRegister<BViewController>.regist(.presentViewController)
        AHRouterRegister<AViewController>.regist(.changeBgColor)
    }
    
    //处理url
    static func shouldHandled(urlStr: String) -> Bool {
        return AHRouter.shared.match(urlStr: urlStr)
    }
}

struct AHRouterRegister<T> where T: Routable {
    enum AHRouterHost: String {
        case presentViewController = "presentVC"
        case changeBgColor = "bgColor"
    }
    
    static func regist(_ host: AHRouterHost) {
        AHRouter.shared.registeRoute(host: host.rawValue) {
            T.route(content: $0)
        }
    }
}
