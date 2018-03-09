//
//  SheUpLoginModel.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2018/1/15.
//  Copyright © 2018年 sweet. All rights reserved.
//

import UIKit

class SheUpLoginModel: NSObject {
    var phoneNum : String
    var verityCode : String
    
    init(phoneNum:String,verityCode:String) {
        self.phoneNum = phoneNum
        self.verityCode = verityCode
    }
}
