//
//  SheUpService.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2018/1/15.
//  Copyright © 2018年 sweet. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class ValidationService {
    static let instance = ValidationService()
    private init(){}
    let minCharacterCount = 11
    let codeCharacterCount = 4
    
    let filePath = NSHomeDirectory() + "/Documents/users.plist"
    //验证用户名
    func validationUserName(_ phoneNum:String) -> Observable<Result> {
        if phoneNum.count == 0 {
            return Observable.just(Result.empty)
        }
        if phoneNum.count<minCharacterCount || phoneNum.count>minCharacterCount {
            return Observable.just(Result.failed(message: "手机号码长度应该为11位"))
        }
        return Observable.just(Result.ok(message: "用户名可用"))
    }
    //检查plist文件中是否有该用户名
    func checkHasUserName(_ phoneNum:String) -> Bool {
        
        guard let userDict  = NSDictionary(contentsOfFile: filePath) else {
            return false
        }
        let phoneNumArray = userDict.allKeys as NSArray
        return phoneNumArray.contains(phoneNum)
    }
    //验证密码
    func validationPassword(_ password:String) -> Result {
        if password.count == 0 {
            return Result.empty
        }
        
        if password.count<codeCharacterCount || password.count>codeCharacterCount {
            return .failed(message: "验证码应该为四位")
        }
      return .ok(message: "密码可用")
    }
    //验证确认密码
    func validationRePassword(_ password:String,_ rePassword:String) -> Result {
        if rePassword.count == 0 {
            return .empty
        }
        
        if rePassword.count<minCharacterCount {
            return .failed(message: "密码长度至少为6位")
        }
        if rePassword == password {
            return .ok(message: "密码可用")
        }
        
        return .failed(message: "两次密码不一样")
    }
    
    func loginUserNameValid(_ phoneNum:String) -> Observable<Result> {
        if phoneNum.count == 0 {
            return Observable.just(Result.empty)
        }
        
        if checkHasUserName(phoneNum) {
            return Observable.just(Result.ok(message: "用户名可用"))
        }
        
        return Observable.just(Result.failed(message: "用户名不存在"))
    }
    
    //登录
    
    func login(_ username:String,password:String) -> Observable<Result> {
        
        guard let userDict = NSDictionary(contentsOfFile: filePath),
            let userPass = userDict.object(forKey: username)
        else {
            return Observable.just(Result.empty)
        }
        if (userPass as! String) == password {
            return Observable.just(Result.ok(message: "登录成功"))
        }else{
            return Observable.just(Result.failed(message: "密码错误"))
        }
    }
}
class SearchService {
    static let instance = SearchService()
    private init () {}
    func getContacts() -> Observable<[SheUpLoginModel]> {
        let contactPath = Bundle.main.path(forResource: "Contact", ofType: "plist")
        let contactArr = NSArray(contentsOfFile: contactPath!) as! Array<[String:String]>
        var modelArr = [SheUpLoginModel]()
        for contactDict in contactArr {
            let model = SheUpLoginModel(phoneNum: contactDict["phone"]!, verityCode: contactDict["code"]!)
            modelArr.append(model)
        }
        return Observable.just(modelArr).observeOn(MainScheduler.instance)
        
    }
    
    func getContacts(withPhone phoneNum:String) -> Observable<[SheUpLoginModel]> {
        if phoneNum == "" {
            return getContacts()
        }
        
        let contactPath = Bundle.main.path(forResource: "Contact", ofType: "plist")
        let contactArr = NSArray(contentsOfFile: contactPath!) as! Array<[String:String]>
        var modelArr = [SheUpLoginModel]()
        for contactDict in contactArr {
            if contactDict["phone"]!.contains(phoneNum){
                let model = SheUpLoginModel(phoneNum: contactDict["phone"]!, verityCode: contactDict["code"]!)
                modelArr.append(model)
            }
        }
        return Observable.just(modelArr).observeOn(MainScheduler.instance)
    }
}










