//
//  AHRouterRegister.swift
//  AHRouter
//
//  Created by IvanGao on 10/18/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

import Foundation

struct AHRouterRegister<T> where T: Routable {
    static func regist(scheme: String, host: String) {
        AHRouter.shared.registeRoute(scheme: scheme, host: host) {
            T.route(content: $0)
        }
    }
}
