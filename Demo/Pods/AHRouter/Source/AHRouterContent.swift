//
//  AHRouterContent.swift
//  AHRouter
//
//  Created by IvanGao on 10/17/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

import Foundation
@objcMembers
public class AHRouterContent: NSObject {
    public var urlComponents: URLComponents?
    public var urlStr: String?
    public var queryDic: [String: String] = [:]
    
    public init(_ urlStr: String) {
        super.init()
        self.urlComponents = URLComponents(string: urlStr)
        self.urlStr = urlStr
        self.urlComponents?.queryItems?.forEach {
            self.queryDic[$0.name] = $0.value
        }
    }
}

