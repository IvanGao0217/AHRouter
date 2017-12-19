//
//  AHRouteMap.swift
//  AHRouter
//
//  Created by IvanGao on 10/17/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

public class AHRouteMap {
    public static let shared = AHRouteMap()
    private typealias AHRouteSchemeDictionary = [String: AHRouteHostDictionary]
    private typealias AHRouteHostDictionary = [String: AHRoute]
    private var routSchemeDic: AHRouteSchemeDictionary = [:]
    private var routHostDic: AHRouteHostDictionary = [:]
    
    func register(route: AHRoute) {
        self.routSchemeDic[route.scheme] = [route.host: route]
    }
    
    public func shouldMatch(urlStr: String) -> Bool {
        guard let scheme = URLComponents(string: urlStr)?.scheme,
            let host = URLComponents(string: urlStr)?.host,
            let route = self.routSchemeDic[scheme]?[host] else {
                return false
        }
        return route.handler(AHRouteContent(urlStr))
    }
}
