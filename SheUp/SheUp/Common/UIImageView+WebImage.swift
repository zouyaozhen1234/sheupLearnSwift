//
//  UIImageView+WebImage.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2018/1/8.
//  Copyright © 2018年 sweet. All rights reserved.
//

import Kingfisher
extension UIImageView{
    
    func ca_setImage(urlStr:String?,placeHoderImage:UIImage?,isAvatar:Bool = false) {
        //先处理URL
        guard let urlString = urlStr,let url = URL(string:urlString) else {
            image = placeHoderImage
            return
        }
        kf.setImage(with: ImageResource(downloadURL: url), placeholder: placeHoderImage, options: [], progressBlock: nil) { [weak self] (image, _, _, _) in
            if isAvatar {
                self?.image = image?.ca_avatarImage(size: self?.bounds.size, backColor: UIColor.white, lineColor: UIColor.clear)
            }
        }
    }
}

















