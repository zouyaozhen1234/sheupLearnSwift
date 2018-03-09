//
//  UIColor+Extension.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2018/2/6.
//  Copyright © 2018年 sweet. All rights reserved.
//

import Foundation
import UIKit
extension UIColor{
    open class var randomColor: UIColor {
        let red = CGFloat(arc4random()%256)/255
        let green = CGFloat(arc4random()%256)/255
        let blue = CGFloat(arc4random()%256)/255
        return UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
