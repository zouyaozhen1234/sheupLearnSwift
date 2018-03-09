//
//  SheUpTableViewCenterCell.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2018/2/6.
//  Copyright © 2018年 sweet. All rights reserved.
//

import UIKit

class SheUpTableViewCenterCell: UITableViewCell {

    private lazy var iconImaage = UIImageView()
    private lazy var titleLabel =  UILabel()
    private lazy var eyeNumberLabel = UILabel()
    private lazy var heartNumberLabel = UILabel()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        iconImaage.frame = CGRect.init(x: 10, y: 10, width: 80, height: 80  )
        self .addSubview(iconImaage)
        iconImaage.backgroundColor = UIColor.randomColor
        
        titleLabel.frame = CGRect.init(x: 100, y: 10, width: 100, height: 20)
        self.addSubview(titleLabel)
        eyeNumberLabel.frame = CGRect.init(x: 100, y: 100-30, width: 100, height: 20)
        self.addSubview(eyeNumberLabel)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
