//
//  AHRouter.swift
//  AHRouter
//
//  Created by IvanGao on 10/17/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

@objc
public protocol Routable: NSObjectProtocol {
    static func route(content: AHRouterContent) -> Bool
}

public class AHRouter {
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
    
    public func shouldMatch(urlStr: String) -> Bool {
        if let scheme = URLComponents(string: urlStr)?.scheme,
            let host = URLComponents(string: urlStr)?.host {
            return self.routSchemeDic[scheme]?[host]?.handler(AHRouterContent(urlStr)) ?? false
        }
        return false
    }
}

class AHRoute {
    var scheme: String
    var host: String
    var handler: ((AHRouterContent) -> Bool)
    
    init(_ scheme: String, host: String, handler: @escaping ((AHRouterContent) -> Bool)) {
        self.scheme = scheme
        self.host = host
        self.handler = handler
    }
}
