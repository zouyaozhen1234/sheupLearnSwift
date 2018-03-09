//
//  encryptionFile.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2017/12/29.
//  Copyright © 2017年 sweet. All rights reserved.
//

import UIKit
class encryptionFile: NSObject {
    func md5WithDict(params: [String:AnyObject]) -> (String) {
        let array = params.keys
        var strSign = ""
        for (i,value) in array.enumerated() {
            if i == array.count - 1{
                let paramValue = params[value]
                let first = value
                let second = paramValue
                strSign = strSign.appendingFormat("%@=%@", [first,second as Any])
            }else{
                let paramValue = params[value]
                let first = value
                let second = paramValue
                strSign = strSign.appendingFormat("%@=%@&", [first,second as Any])
            }
        }
        
        let strMd5 = strSign .md5 .lowercased()
        let time = params["time"]
        let keyStr = "buy@mplife@2014^by#from$superbuy"
        let md5Str = "sign=" + "\(strMd5)" + "&time=" + "\(String(describing: time))" + "&key=" + "\(keyStr)"
        print(md5Str)
       let result =  cryptoOperation(encriptString: md5Str).replacingOccurrences(of: " ", with: "")
        print("result=\(result)")
        return result
    }
    
    /*func randomStringOfLength(_ length:Int) -> String {
        var string = ""
        var randomStringArray:Array<Any>?
        
        for _ in (1...length) {
            string.append(randomStringArray![Int(arc4random_uniform(
                UInt32(randomStringArray?.count) - 1))])
        }
        return string
    }
    func encrypt(encryptData:String){
        key = randomStringOfLength(kCCKeySize3DES)
        let inputData : Data = encryptData.data(using: String.Encoding.utf8)!
        
        let keyData: Data = key.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        let keyBytes = UnsafeMutableRawPointer(mutating: (keyData as NSData).bytes)
        let keyLength = size_t(kCCKeySize3DES)
        
        let dataLength = Int(inputData.count)
        let dataBytes = UnsafeRawPointer((inputData as NSData).bytes)
        let bufferData = NSMutableData(length: Int(dataLength) + kCCBlockSize3DES)!
        let bufferPointer = UnsafeMutableRawPointer(bufferData.mutableBytes)
        let bufferLength = size_t(bufferData.length)
        var bytesDecrypted = Int(0)
        
        let cryptStatus = CCCrypt(
            UInt32(kCCEncrypt),
            UInt32(kCCAlgorithm3DES),
            UInt32(kCCOptionECBMode + kCCOptionPKCS7Padding),
            keyBytes,
            keyLength,
            nil,
            dataBytes,
            dataLength,
            bufferPointer,
            bufferLength,
            &bytesDecrypted)
        
        if Int32(cryptStatus) == Int32(kCCSuccess) {
            bufferData.length = bytesDecrypted
            encrypt(inputData: bufferData as Data)
        } else {
            print("加密过程出错: \(cryptStatus)")
        }
    }*/
    
    
    
    internal func cryptoOperation(encriptString:String) -> String {
            // Validation checks.
//            let jm = "fjdkasljfkls"
            let jm = encriptString
            let jmData = jm.data(using: String.Encoding.utf8)!
            let key = "34npzntC" //这里是java端对应的key byte[]的字符串表现形式 btye[] key = {10, 20, 30, 40, 50, 60 ,70, 80}
            var t:String = ""
            
            // Prepare data parameters
            let keyData: Data! = key.data(using: String.Encoding.utf8, allowLossyConversion: false)!
            let keyBytes = keyData.withUnsafeBytes { (bytes: UnsafePointer<UInt8>) -> UnsafePointer<UInt8> in
                return bytes
            }
            
            //let keyBytes         = keyData.bytes.bindMemory(to: Void.self, capacity: keyData.count)
            let dataLength       = Int(jmData.count)
            let dataBytes        = jmData.withUnsafeBytes { (bytes: UnsafePointer<UInt8>) -> UnsafePointer<UInt8> in
                return bytes
            }
            
            
            var bufferData       = Data(count: Int(dataLength) + 8)
            let bufferPointer    = bufferData.withUnsafeMutableBytes { (bytes: UnsafeMutablePointer<UInt8>) -> UnsafeMutablePointer<UInt8> in
                return bytes
            }
            let bufferLength     = size_t(bufferData.count)
            let ivStr = "\0x12\0x34\0x56\0x78\0x90\0xAB\0xCD\0xEF" //这里是java端对应的iv变量字符串
            let iv = ivStr.data(using: String.Encoding.utf8)!
            let ivBuffer: UnsafePointer<UInt8>? = iv.withUnsafeBytes({ (bytes: UnsafePointer<UInt8>) -> UnsafePointer<UInt8> in
                return bytes
            })
            var bytesDecrypted   = Int(0)
            // Perform operation
            let cryptStatus = CCCrypt(
                0,                  // Operation 这里代表DES加密而非解密
                1,    // Algorithm 这里代表DES算法（其他数字可以是别的算法，如AES），研究一下OC的自带的方法就行了
                1,                    // Options 这里代表PKCS7Padding
                keyBytes,                   // key data
                8,                  // key length
                ivBuffer,                   // IV buffer
            dataBytes,                  // input data
                dataLength,                 // input length
                bufferPointer,              // output buffer
                bufferLength,               // output buffer length
                &bytesDecrypted)            // output bytes decrypted real length
            if Int32(cryptStatus) == Int32(kCCSuccess) {
                bufferData.count = bytesDecrypted // Adjust buffer size to real bytes
                print(bufferData)
                let a = bufferData.withUnsafeBytes{
                    [UInt8](UnsafeBufferPointer(start: $0, count: bufferData.count))
                }
                print(a)
                t = bufferData.base64EncodedString()
            }
            return t
        }
        
    }
