//
//  AHRouter.swift
//  AHRouter
//
//  Created by IvanGao on 10/17/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

import Foundation

class AHRouter {
    private init() {
    }
    static let shared = AHRouter()
    private var routDic: [String: ((AHRouteContent) -> Bool)] = [:]
    
    func registeRoute(host: String, handler: @escaping ((AHRouteContent) -> Bool)) {
        AHRouter.shared.routDic[host] = handler
    }
    
    func match(urlStr: String) -> Bool {
        if let host = URLComponents(string: urlStr)?.host,
            let handled = AHRouter.shared.routDic[host]?(AHRouteContent(urlStr)) {
            return handled
        } else {
            self.unMatched(urlStr)
            return false
        }
    }
    
    //通用未处理url的处理逻辑
    func unMatched(_ urlStr: String) {
        print("unmatchedUrl: \(urlStr)")
    }
}
