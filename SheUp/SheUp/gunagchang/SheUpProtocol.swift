//
//  SheUpProtocol.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2018/1/15.
//  Copyright © 2018年 sweet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum Result{
    case ok(message:String)
    case empty
    case failed(message:String)
}

extension Result {
    var isValid : Bool {
        switch self {
        case .ok:
            return true
        default:
            return false
        }
    }
    
}

extension Result {
    var description : String {
        switch self {
        case let .ok (message):
            return message
        case.empty:
            return ""
        case let .failed(message):
            return message
        }
    }
}
extension Result {
    var textColor: UIColor {
        switch self {
        case .ok:
            return UIColor(red: 138.0/255.0, green: 221.0/255.0, blue: 109.0/255.0, alpha: 1.0)
        case.empty:
            return UIColor.black
        case.failed:
            return UIColor.red

        }
    }
}

extension Reactive where Base:UILabel {
    
    var validationResult: UIBindingObserver<Base,Result> {
        return UIBindingObserver(UIElement: base, binding: { (label, result) in
            label.textColor = result.textColor
            label.text = result.description
        })
    }
}
extension Reactive where Base:UITextField{
    var inputEnabled: UIBindingObserver<Base,Result> {
        return UIBindingObserver(UIElement: base, binding: { (textFiled, result) in
            textFiled .isEnabled = result.isValid
        })
    }
}

















