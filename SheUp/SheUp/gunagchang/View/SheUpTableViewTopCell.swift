//
//  SheUpTableViewTopCell.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2018/2/6.
//  Copyright © 2018年 sweet. All rights reserved.
//

import UIKit
import SnapKit
class SheUpTableViewTopCell: UITableViewCell {

    private var cusScrollView:UIScrollView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        cusScrollView = UIScrollView()
        cusScrollView?.backgroundColor = UIColor.green
        cusScrollView?.showsVerticalScrollIndicator = false
        cusScrollView?.showsHorizontalScrollIndicator = false
        cusScrollView?.isPagingEnabled = true
        cusScrollView?.contentSize = CGSize.init(width: K_SCREEN_WIDTH * 3, height: K_SCREEN_HEIGHT)
        self.contentView.addSubview(cusScrollView!)
        cusScrollView?.snp.makeConstraints({ (make) in
            make.left.equalTo((cusScrollView?.superview?.snp.left)!)
            make.right.equalTo((cusScrollView?.superview?.snp.right)!)
            make.top.equalTo((cusScrollView?.superview?.snp.top)!)
            make.bottom.equalTo((cusScrollView?.superview?.snp.bottom)!)
            
        })
        
        for i in 0..<3 {
            let imageView = UIImageView()
            imageView.backgroundColor = UIColor.randomColor
            imageView.frame = CGRect.init(x: CGFloat(i) * K_SCREEN_WIDTH, y: 0, width: K_SCREEN_WIDTH, height: 210)
            cusScrollView?.addSubview(imageView)
            print("-----%@-----",imageView.frame)
        } 
        
        
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
