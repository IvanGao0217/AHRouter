//
//  AHRouterRegister.swift
//  AHRouter
//
//  Created by IvanGao on 10/18/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

public struct AHRouterRegister<T> where T: Routable {
    public static func route(scheme: String, host: String) {
        AHRouter.shared.register(route: AHRoute(scheme, host: host) {
            T.route(content: $0)
        })
    }
}

