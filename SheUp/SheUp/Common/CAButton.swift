//
//  CAButton.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2018/1/5.
//  Copyright © 2018年 sweet. All rights reserved.
//

import UIKit

func custonButton(title:String,backgroundImageName:String,titleColor:UIColor,titleFont:UIFont) ->UIButton {
    let  button = UIButton(type: .custom)
    button .setTitle(title, for: .normal)
    button .setBackgroundImage(UIImage(named: backgroundImageName), for: .normal)
    button .setTitleColor(titleColor, for: .normal)
    button.titleLabel?.font = titleFont
    button.titleLabel?.textAlignment = .center
    return button
}
