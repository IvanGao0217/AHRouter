//
//  AHRouterRegister.swift
//  AHRouter
//
//  Created by IvanGao on 10/18/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

import Foundation

public struct AHRouterRegister<T> where T: Routable {
    public static func regist(scheme: String, host: String, priority: Int = 250) {
        AHRouter.shared.register(route: AHRoute(scheme, host: host, priority: priority) {
            T.route(content: $0)
        })
    }
}

