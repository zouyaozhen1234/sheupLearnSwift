//
//  SheUpMainModel.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2017/12/27.
//  Copyright © 2017年 sweet. All rights reserved.
//

import UIKit
import YYModel
class SheUpMainModel: NSObject {
    @objc dynamic var recommend_id :String?
    @objc dynamic var city:String?
    @objc dynamic var activity_end_date:String?
    @objc dynamic var pmark :String?
    @objc dynamic var come_from_id:String?
    @objc dynamic var cmark :String?
    @objc dynamic var tag_name :String?
    @objc dynamic var summary:String?
    @objc dynamic var activity_start_date :String?
    @objc dynamic var tag_id:String?
    @objc dynamic var img_url :String?
    @objc dynamic var www_url:String?
    @objc dynamic var title :String?
    @objc dynamic var activity_title :String?
    @objc dynamic var tag_img_url:String?
    @objc dynamic var img_width:Int64 = 0
    @objc dynamic var img_height:Int64 = 0
    @objc dynamic var tag_img_width:Int64 = 0
    @objc dynamic var tag_img_height:Int64 = 0
    @objc dynamic var come_from_type :String?
    @objc dynamic var sequence :String?
    @objc dynamic var pos_id:String?
    @objc dynamic var user_type :String?
    @objc dynamic var user_type_str:String?
    @objc dynamic var views:String?
    @objc dynamic var praises:String?
    @objc dynamic var topic_content:String?
    @objc dynamic var start_date:String?
    @objc dynamic var cover_img_url:String?
    override var description: String{
        return yy_modelDescription()
    }
}

