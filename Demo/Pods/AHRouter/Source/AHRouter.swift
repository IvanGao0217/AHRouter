//
//  AHRouter.swift
//  AHRouter
//
//  Created by IvanGao on 10/17/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

import Foundation

@objc
public protocol Routable: NSObjectProtocol {
    static func route(content: AHRouterContent) -> Bool
}

class AHRouter {
    private typealias AHRouteSchemeDictionary = [String: AHRouteHostDictionary]
    private typealias AHRouteHostDictionary = [String: AHRoute]
    private var routSchemeDic: AHRouteSchemeDictionary = [:]
    private var routHostDic: AHRouteHostDictionary = [:]
    
    public static let shared = AHRouter()
    private init() {
    }
    
    func register(route: AHRoute) {
        self.routSchemeDic[route.scheme] = [route.host: route]
    }
    
    public func shouldMatch(urlStr: String, minimalPriority: Int) -> Bool {
        if let scheme = URLComponents(string: urlStr)?.scheme,
            let host = URLComponents(string: urlStr)?.host,
            let priority = self.routSchemeDic[scheme]?[host]?.priority,
            priority >= minimalPriority {
            return self.routSchemeDic[scheme]?[host]?.handler(AHRouterContent(urlStr)) ?? false
        }
        return false
    }
}

class AHRoute {
    var scheme: String
    var host: String
    var handler: ((AHRouterContent) -> Bool)
    var priority: Int
    
    init(_ scheme: String, host: String, priority: Int, handler: @escaping ((AHRouterContent) -> Bool)) {
        self.scheme = scheme
        self.host = host
        self.priority = priority
        self.handler = handler
    }
}
