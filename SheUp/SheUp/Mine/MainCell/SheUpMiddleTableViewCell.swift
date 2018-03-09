//
//  SheUpMiddleTableViewCell.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2017/12/27.
//  Copyright © 2017年 sweet. All rights reserved.
//

import UIKit
import Kingfisher
class SheUpMiddleTableViewCell: UITableViewCell {
   private lazy var letftImage : UIImageView = UIImageView()
   private lazy var titleLabel : UILabel = UILabel()
   private lazy var lookImage : UIImageView = UIImageView()
   private lazy var favImage : UIImageView = UIImageView()
   private lazy var lookLabel : UILabel = UILabel()
   private lazy var favLabel : UILabel = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        letftImage.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.contentView.addSubview(letftImage)
        
        titleLabel.frame = CGRect(x: 100 + 10, y: 10, width: self.contentView.frame.size.width-(100+10+30), height: 20)
        titleLabel.textColor = RGB(r: 41, g: 41, b: 41)
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(titleLabel)
        
        lookImage.frame = CGRect(x: 110, y: 100-25, width: 20, height: 15)
        lookImage.image = UIImage(named: "eye_icon.png")
        self.contentView.addSubview(lookImage)
        
        lookLabel.frame = CGRect(x: (lookImage.frame.origin.x) + (lookImage.frame.size.width) + 3, y: (lookImage.frame.origin.y), width: 50, height: 20)
        lookLabel.font = UIFont.systemFont(ofSize: 10)
        lookLabel.textColor = RGB(r: 169, g: 169, b: 169)
        self.contentView.addSubview(lookLabel)
        
        favImage.frame = CGRect(x: lookLabel.frame.origin.x + lookLabel.frame.size.width + 10, y: lookImage.frame.origin.y, width: 16, height: 16)
        favImage.image = UIImage(named: "praise_normal.png")
        self.contentView.addSubview(favImage)
        
        favLabel.frame = CGRect(x: favImage.frame.origin.x + (favImage.frame.size.width) + 3, y: (lookLabel.frame.origin.y), width: lookLabel.frame.size.width, height: lookLabel.frame.size.height)
        favLabel.text = "40"
        favLabel.font = UIFont.systemFont(ofSize: 10)
        favLabel.textColor = RGB(r: 169, g: 169, b: 169)
        self.contentView.addSubview(favLabel)
    }
    func showDataWithViewModel(viewModel:SheUpMainViewModel,index:NSInteger) {
        guard let titleStr = viewModel.title else {
            return
        }
        titleLabel.text = titleStr
        lookLabel.text = viewModel.lookNum
        favLabel.text = viewModel.favNum
        guard let imageStr = viewModel.cover_img_url,let Url = NSURL(string: imageStr) else{
            return
        }
        letftImage.kf.setImage(with: ImageResource(downloadURL: Url as URL))
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
