//
//  AHRoute.swift
//  AHRouter
//
//  Created by IvanGao on 10/18/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

class AHRoute {
    var scheme: String
    var host: String
    var handler: ((AHRouteContent) -> Bool)
    
    init(_ scheme: String, host: String, handler: @escaping ((AHRouteContent) -> Bool)) {
        self.scheme = scheme
        self.host = host
        self.handler = handler
    }
}

