//
//  SheUpTableViewCell.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2018/1/5.
//  Copyright © 2018年 sweet. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
class SheUpTableViewCell: UITableViewCell {
    let buttonTapped = PublishSubject<String>()
    private lazy var headerImage:UIImageView = UIImageView()
    private lazy var nameLabel:UILabel = UILabel()
     lazy var loginButton:UIButton = UIButton()
    var disposeBag = DisposeBag()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let topBackView  = customView1(backColor: UIColor.white)
        topBackView.isUserInteractionEnabled = true
        self.contentView.addSubview(topBackView)
        topBackView.snp.makeConstraints { (make) in
        make.left.equalTo(self.contentView.snp.left)
        make.top.equalTo(self.contentView.snp.top).offset(0)
        make.right.equalTo(self.contentView.snp.right)
        make.bottom.equalTo(self.contentView.snp.bottom)
        }
        
        headerImage.image = UIImage(named: "mineHeaderImage")
        topBackView.addSubview(headerImage)
        
        headerImage.snp.makeConstraints { (make) in
         make.top.equalTo(topBackView.snp.top).offset(10)
           make.bottom.equalTo(topBackView.snp.bottom).offset(-10)
            make.left.equalTo(topBackView.snp.left).offset(20)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        
        loginButton = custonButton(title: "登录", backgroundImageName: "123", titleColor: UIColor.white, titleFont: UIFont.systemFont(ofSize: 12))
        loginButton.backgroundColor = RGB(r: 254, g: 108, b: 179)
        loginButton.layer.masksToBounds =  true
        loginButton.layer.cornerRadius = 5.0
        //两个都是点击事件，不知道有什么区别
//        loginButton.rx.tap .subscribe(onNext: { (event) in
//            print("甜甜\(event)")
//        })
//        loginButton.rx.tap.map{"登录"}.bind(to: buttonTapped).disposed(by: disposeBag)
//        buttonTapped.subscribe{print($0.element ?? $0)}
//        .disposed(by: disposeBag)
        topBackView.addSubview(loginButton)
        
        loginButton.snp .makeConstraints { (make) in
        make.right.equalTo(topBackView.snp.right).offset(-30)
            make.centerY.equalTo(topBackView.snp.centerY)
            make.width.equalTo(60)
            make.height.equalTo(20)
        }
      
        nameLabel = customLabel(title: "这是测试这是测", font: UIFont.systemFont(ofSize: 15), color: UIColor.lightGray, backColor: UIColor.white, textAligen: .left)
        nameLabel.numberOfLines = 0
        topBackView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
        make.left.equalTo(headerImage.snp.right).offset(5)
        make.top.equalTo(headerImage.snp.top).offset(10)
        make.height.equalTo(20)
        make.right.equalTo(loginButton.snp.left).offset(-10)
        }
    }

    func setTableData() {
        //设置个人中心数据
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
