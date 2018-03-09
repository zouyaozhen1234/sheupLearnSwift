//
//  SheUpBottomTableViewCell.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2017/12/27.
//  Copyright © 2017年 sweet. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
class SheUpBottomTableViewCell: UITableViewCell {
    
    private lazy var bottomImageView : UIImageView = UIImageView()
    private lazy var bottomTagImageView : UIImageView = UIImageView()
    private lazy var bottomTimeLabel : UILabel = UILabel()
    private lazy var bottomTittleLabel : UILabel = UILabel()
    private lazy var bottomLabelBack : UIView = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(bottomImageView)
        bottomImageView.snp.makeConstraints { (make) in
         make.left.equalTo(self.contentView.snp.left)
         make.top.equalTo(self.contentView.snp.top)
         make.right.equalTo(self.contentView.snp.right)
        make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
        }
        
        bottomImageView.addSubview(bottomTagImageView)
        bottomTagImageView.snp .makeConstraints { (make) in
            make.left.equalTo(bottomImageView.snp.left).offset(10)
            make.top.equalTo(bottomImageView.snp.top)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        
        bottomLabelBack.backgroundColor = UIColor.white
        bottomLabelBack.alpha = 8.0
        bottomImageView.addSubview(bottomLabelBack)
        
        bottomLabelBack.snp.makeConstraints { (make) in
            make.left.equalTo(bottomTagImageView.snp.right).offset(10)
            make.bottom.equalTo(bottomImageView.snp.bottom).offset(-10)
            make.right.equalTo(bottomImageView.snp.right).offset(-20)
            make.height.equalTo(50)
        }
        
        bottomTimeLabel.text = "2017.07.28"
        bottomTimeLabel.textColor = UIColor.red
        bottomTimeLabel.font = UIFont.systemFont(ofSize: 12)
        bottomTimeLabel.textAlignment = .center
        bottomLabelBack.addSubview(bottomTimeLabel)
        bottomTimeLabel.snp .makeConstraints { (make) in
            make.left.equalTo(bottomLabelBack.snp.left).offset(10)
            make.top.equalTo(bottomLabelBack.snp.top).offset(5)
            make.right.equalTo(bottomLabelBack.snp.right).offset(-10)
            make.height.equalTo(20)
        }
        
        bottomTittleLabel.text = "你的名字我的回忆"
        bottomTittleLabel.textColor = UIColor.lightGray
        bottomTittleLabel.font = UIFont.systemFont(ofSize: 15)
        bottomTittleLabel.textAlignment = .center
        bottomLabelBack.addSubview(bottomTittleLabel)
        bottomTittleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(bottomLabelBack.snp.left).offset(10)
            make.top.equalTo(bottomTimeLabel.snp.bottom).offset(5)
            make.right.equalTo(bottomLabelBack.snp.right).offset(-10)
            make.height.equalTo(20)
        }
    }
    func showDataWithModel(viewModel:SheUpMainViewModel) {
        bottomTimeLabel.text = viewModel.timeStr
        bottomTittleLabel.text = viewModel.bottomTitle
        bottomImageView.kf.setImage(with: ImageResource(downloadURL: NSURL(string: viewModel.img_url!)! as URL))
        bottomTagImageView.kf.setImage(with: ImageResource(downloadURL: NSURL(string: viewModel.tag_url!)! as URL))
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
