//
//  CommonFile.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2017/12/26.
//  Copyright © 2017年 sweet. All rights reserved.
//

import Foundation
import UIKit


func RGB(r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
    //
    return UIColor(red: r/225.0, green: g/225.0, blue: b/225.0, alpha: 1.0)
}
public let SCREEN_WIDTH = UIScreen.main.bounds.size.width

public let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

func versionCheck()->(String) {
    guard let infoDict = Bundle.main.infoDictionary else {
        return ""
    }
    let version = infoDict["CFBundleVersion"] as! String
    return version
}
