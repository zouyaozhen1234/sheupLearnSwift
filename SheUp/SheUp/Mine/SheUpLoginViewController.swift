//
//  SheUpLoginViewController.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2018/1/12.
//  Copyright © 2018年 sweet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
class SheUpLoginViewController: UIViewController {
    let disposeBag = DisposeBag()
    private lazy var phoneTextFiled: UITextField = UITextField()
    private lazy var vertyTextFiled:UITextField = UITextField()
    private lazy var loginButton:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor .white
        self.navigationItem.title = "登录"
        setNavigationBar()
        createInfo()
        
        let viewModel =  SheUpLoginViewModel(input: (phoneNum: phoneTextFiled.rx.text.orEmpty.asDriver(), vertiyCode: vertyTextFiled.rx.text.orEmpty.asDriver(), loginTaps: loginButton.rx.tap.asDriver()), service: ValidationService.instance)
        viewModel.LoginButtonEnabled.drive(onNext:{ [weak self] (valid) in
            
            self?.loginButton.isEnabled = valid
            self?.loginButton.alpha = valid ? 1.0 : 0.5
        }).disposed(by: disposeBag)
        
        viewModel.LoginResult.drive(onNext:{
            [weak self](result) in
            switch result {
            case let .ok(message):
//                self?.performSegue(withIdentifier: "showListSegue", sender: nil)
                print("登录成功")
                self?.showAlert(message: message)
            case .empty:
                self?.showAlert(message: "456")
            case .failed(let message):
                self?.showAlert(message: message)
            }
        }).disposed(by: disposeBag)
    }
    
    func showAlert(message:String) {
        let action = UIAlertAction(title: "确定", style: .default, handler: nil)
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
}

private extension SheUpLoginViewController{
    func createInfo() {
        let phoneLabel = customLabel(title: "手机号", font: UIFont.systemFont(ofSize: 15), color: UIColor.black, backColor: UIColor.clear, textAligen: .center)
        self.view.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(10)
            make.centerY.equalTo(self.view.snp.centerY).offset(-80)
            make.width.equalTo(60)
            make.height.equalTo(20)
        }
        
        phoneTextFiled.placeholder = "请输入手机号码"
        self.view.addSubview(phoneTextFiled)
        
        phoneTextFiled.snp.makeConstraints { (make) in
            make.left.equalTo(phoneLabel.snp.right).offset(15)
            make.top.equalTo(phoneLabel.snp.top).offset(0)
            make.right.equalTo(self.view.snp.right).offset(-20)
            make.bottom.equalTo(phoneLabel.snp.bottom)
        }
        let firstLine = customView1(backColor: RGB(r: 187 , g: 186, b: 194))
        self.view.addSubview(firstLine)
        
        firstLine.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(10)
            make.top.equalTo(phoneLabel.snp.bottom).offset(5)
            make.right.equalTo(self.view.snp.right).offset(-10)
            make.height.equalTo(1)
        }
        
        
        let vertyLabel = customLabel(title: "验证码", font: UIFont.systemFont(ofSize: 15), color: UIColor.black, backColor: UIColor.clear, textAligen: .center)
        self.view.addSubview(vertyLabel)
        
        vertyLabel.snp.makeConstraints { (make) in
            make.left.equalTo(phoneLabel.snp.left)
            make.top.equalTo(firstLine.snp.bottom).offset(10)
            make.width.equalTo(phoneLabel)
            make.height.equalTo(phoneLabel)
        }
        
//                                        let vertyTextFiled = UITextField()
        vertyTextFiled.placeholder = "请输入验证码"
        self.view.addSubview(vertyTextFiled)
        
        vertyTextFiled.snp.makeConstraints { (make) in
            make.left.equalTo(phoneTextFiled.snp.left)
            make.top.equalTo(vertyLabel.snp.top).offset(0)
            make.right.equalTo(phoneTextFiled.snp.right)
            make.bottom.equalTo(vertyLabel.snp.bottom)
        }
        
        let secondLine = customView1(backColor: RGB(r: 187 , g: 186, b: 194))
        self.view.addSubview(secondLine)
        
        secondLine.snp.makeConstraints { (make) in
            make.left.equalTo(firstLine.snp.left).offset(10)
            make.top.equalTo(vertyLabel.snp.bottom).offset(5)
            make.right.equalTo(firstLine.snp.right)
            make.height.equalTo(firstLine)
        }
        
        loginButton = custonButton(title: "登录", backgroundImageName: "23", titleColor: UIColor.white, titleFont: UIFont.systemFont(ofSize: 16))
        loginButton.backgroundColor = RGB(r: 223, g: 19, b: 108)
        loginButton.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
        self.view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(15)
            make.right.equalTo(self.view.snp.right).offset(-15)
            make.top.equalTo(secondLine.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        

    }
    @objc func loginClick(){
        
    }
    internal override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneTextFiled.resignFirstResponder()
        vertyTextFiled .resignFirstResponder()
    }
}



private extension SheUpLoginViewController{
    func setNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 223/255, green: 19/255, blue: 108/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        let leftBtn = UIButton(type: .custom)
        
        leftBtn .setBackgroundImage(UIImage(named: "back.png"), for: .normal)
        leftBtn.frame = CGRect(x: 0, y: 0, width: 22, height: 18)
        leftBtn.addTarget(self, action: #selector(leftClick), for: .touchUpInside)
        let leftItem = UIBarButtonItem(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    @objc func leftClick(){
        self.navigationController?.popViewController(animated: true)
    }
}

