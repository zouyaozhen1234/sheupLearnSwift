//
//  City.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2018/1/11.
//  Copyright © 2018年 sweet. All rights reserved.
//

import UIKit

class City: NSObject {
    var title = "某城市"
    var imageName = "456"
    
    convenience init(title:String,imageName:String) {
        self.init()
        self.title = title
        self.imageName = imageName
    }
    
}
