//
//  AHRouterContent.swift
//  AHRouter
//
//  Created by IvanGao on 10/17/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

import Foundation

struct AHRouteContent {
    var urlComponents: URLComponents?
    var urlStr: String?
    var queryDic: [String: String] = [:]
    var itemId: String?
    var sharedByUserId: String?
    
    init(_ urlStr: String) {
        self.urlComponents = URLComponents(string: urlStr)
        self.urlStr = urlStr
        self.urlComponents?.queryItems?.forEach {
            self.queryDic[$0.name] = $0.value
        }
        self.itemId = self.urlComponents?.path.components(separatedBy: "/").last
        self.sharedByUserId = self.queryDic["shareby"]
    }
}
