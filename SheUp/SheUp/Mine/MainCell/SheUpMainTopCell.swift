//
//  SheUpMainTopCell.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2017/12/27.
//  Copyright © 2017年 sweet. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit
class SheUpMainTopCell: UITableViewCell {

    var backScroller : UIScrollView?
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
       super .init(style: style, reuseIdentifier: reuseIdentifier)
        backScroller = UIScrollView()
        backScroller?.isPagingEnabled = true
        backScroller?.showsHorizontalScrollIndicator = false
        self.contentView.addSubview(backScroller!)
        backScroller?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.contentView.snp.left)
            make.top.equalTo(self.contentView.snp.top)
            make.bottom.equalTo(self.contentView.snp.bottom)
            make.width.equalTo(SCREEN_WIDTH)
        })
    }
    func getImageWithArray(array:Array<Any>) {
        for i in 0..<array.count {
            let viewModel = array[i] as! SheUpMainViewModel
            let imageView = UIImageView(frame: CGRect(x: CGFloat(i) * SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: 210))
            guard let imageStr = viewModel.img_url else{
                return
            }
            imageView.kf.setImage(with: ImageResource(downloadURL:NSURL(string: imageStr)! as URL))
            backScroller?.addSubview(imageView)
        }
        backScroller?.contentSize = CGSize(width: SCREEN_WIDTH * CGFloat(array.count), height: (backScroller?.frame.size.height)!)
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
