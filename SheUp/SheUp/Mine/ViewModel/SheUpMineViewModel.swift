//
//  SheUpMineViewModel.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2018/1/12.
//  Copyright © 2018年 sweet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
class SheUpMineViewModel: NSObject {
    let items = Observable.just([
        SectionModel(
            //section = 0
            model: Province("河南省"),
            items: [ City(title: "我的关注",imageName: "MyFocus")]
        ),
        SectionModel(
            model: Province("河南省"),
            items: [ City(title: "我的关注",imageName: "MyFocus")]
        ),
        SectionModel(
            model: Province("广东省"),
            items: [ City(title: "我的活动",imageName: "MyActivityIcon")]
        ),
        SectionModel(
            model: Province("辽宁省"),
            items: [ City(title: "我的话题",imageName: "MyTopic")]
        ),
        SectionModel(
            model: Province("辽宁省"),
            items: [ City(title: "     设置",imageName: "1")]
        ),
        SectionModel(
            model: Province("辽宁省"),
            items: [ City(title: "     建议",imageName: "1")]
        ),
        SectionModel(
            model: Province("辽宁省"),
            items: [ City(title: "     联系我们",imageName: "1")]
        )
   ])
}
