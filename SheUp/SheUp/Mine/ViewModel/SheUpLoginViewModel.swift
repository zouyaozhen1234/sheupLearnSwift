//
//  SheUpLoginViewModel.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2018/1/15.
//  Copyright © 2018年 sweet. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class SheUpLoginViewModel {
    
    let LoginPhone : Driver<Result>
    let LoginButtonEnabled : Driver<Bool>
    let LoginResult : Driver<Result>
    
    
    init(input:(phoneNum:Driver<String>,vertiyCode:Driver<String>,loginTaps:Driver<Void>),service:ValidationService) {
        
        LoginPhone = input.phoneNum.flatMapLatest { phoneNum in
            return service.loginUserNameValid(phoneNum).asDriver(onErrorJustReturn: .failed(message: "连接server失败"))
        }
        let phoneAndCode = Driver.combineLatest(input.phoneNum,input.vertiyCode){
            return($0,$1)
        }
        LoginResult = input.loginTaps.withLatestFrom(phoneAndCode).flatMapLatest{ (username, password)  in
            service.login(username, password: password).asDriver(onErrorJustReturn: .failed(message: "连接server失败"))
        }
        LoginButtonEnabled = input.phoneNum.map{
            $0.count>0
        }.asDriver()
    }
}








