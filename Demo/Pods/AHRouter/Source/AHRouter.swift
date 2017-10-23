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
    private typealias AHRouteHostDictionary = [String: ((AHRouterContent) -> Bool)]
    private var routSchemeDic: AHRouteSchemeDictionary = [:]
    private var routHostDic: AHRouteHostDictionary = [:]
    
    public static let shared = AHRouter()
    private init() {
    }
    
    func registeRoute(scheme: String, host: String, handler: @escaping ((AHRouterContent) -> Bool)) {
        self.routSchemeDic[scheme] = [host: handler]
    }
    
    public func shouldMatch(urlStr: String) -> Bool {
        if let scheme = URLComponents(string: urlStr)?.scheme,
            let host = URLComponents(string: urlStr)?.host,
            let handled = self.routSchemeDic[scheme]?[host]?(AHRouterContent(urlStr)) {
            return handled
        }
        return false
    }
}

