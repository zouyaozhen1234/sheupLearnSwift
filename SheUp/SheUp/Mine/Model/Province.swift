//
//  Province.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2018/1/11.
//  Copyright © 2018年 sweet. All rights reserved.
//

import UIKit

class Province: NSObject {
    var title = "某省"
    convenience init(_ title:String) {
        self.init()
        self.title = title
    }
}
