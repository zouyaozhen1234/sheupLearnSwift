//
//  CALabel.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2018/1/5.
//  Copyright © 2018年 sweet. All rights reserved.
//

import UIKit

func customLabel(title:String,font:UIFont,color:UIColor,backColor:UIColor,textAligen:NSTextAlignment)->UILabel  {
    let label = UILabel()
    label.text = title
    label.font = font
    label.textColor = color
    label.backgroundColor = backColor
    label.textAlignment = textAligen
    return label
}
