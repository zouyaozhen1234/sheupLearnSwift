//
//  SheUpMainViewModel.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2017/12/27.
//  Copyright © 2017年 sweet. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
class SheUpMainViewModel:CustomStringConvertible {
    var mainModel : SheUpMainModel
    var title : String?
    var lookImage : UIImage?
    var favImage:UIImage?
    var lookNum:String?
    var favNum:String?
    var timeStr:String?
    var cover_img_url:String?
    var img_url:String?
    var bottomTitle:String?
    var cellHeight:CGFloat = 0
    var tag_url:String?
    
    
    init(model:SheUpMainModel) {
        self.mainModel = model
        lookImage = UIImage(named: "eye_icon.png")
        favImage = UIImage(named: "praise_normal.png")
        lookNum = model.views
        favNum = model.praises
        title = model.topic_content
        timeStr = model.activity_start_date
        bottomTitle = model.title
        cover_img_url = model.cover_img_url
        img_url = model.img_url
        tag_url = model.tag_img_url
    }
    
    func caculateRowHeight(model:SheUpMainModel) -> CGFloat {
        let screenWid = SCREEN_WIDTH;
        let screHeigh = (Int64(screenWid) * model.img_height)/model.img_width
        cellHeight = CGFloat(screHeigh)
        return CGFloat(screHeigh)
    }
//    func caculateTopCellHeight(model:SheUpMainModel) -> CGFloat {
//        let screenWid = SCREEN_WIDTH;
//        let screHeigh = (Int64(screenWid) * model.img_height)/model.img_width
//        return CGFloat(screHeigh)
//    }
    
    var description: String{
        return mainModel .description
    }
}
