//
//  AHRouterManager.swift
//  AHRouterDemo
//
//  Created by IvanGao on 2017/10/23.
//  Copyright © 2017年 IvanGao. All rights reserved.
//

import Foundation
import AHRouter

class AHRouterManager {
    //App初始化时urlHost的注册
    static func startRegist() {
        AHRouterRegister<BViewController>.regist(scheme: "wealoha", host: "qwe")
        AHRouterRegister<AViewController>.regist(scheme: "wealoha", host: "qweasd")
    }
    
    //处理url
    static func shouldHandled(urlStr: String) -> Bool {
        return false
    }
}


