//
//  AHRouterRegister.swift
//  AHRouter
//
//  Created by IvanGao on 10/18/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

@objc
public protocol Routable: NSObjectProtocol {
    static func route(content: AHRouteContent) -> Bool
}

public struct AHRouterRegister<T> where T: Routable {
    public static func register(scheme: String, host: String) {
        AHRouteMap.shared.register(route: AHRoute(scheme, host: host) {
            T.route(content: $0)
        })
    }
}
