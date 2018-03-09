//
//  SheUpHomeViewController.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2017/12/26.
//  Copyright © 2017年 sweet. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON
import YYModel
import MJRefresh
class SheUpHomeViewController: SheUpBaseViewController {
    var topArray = [SheUpMainViewModel]()
    var middleArray = [SheUpMainViewModel]()
    var bottomArray = [SheUpMainViewModel]()
    let header = MJRefreshNormalHeader()
    private let topCellId = "topCellId"
    private let middleCellId = "middleCellId"
    private let bottomCellId = "bottomCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = UIColor.white
        super .createLeftAndRightItem(leftRect:CGRect() , rightRect: CGRect(x: 0, y: 0, width: 16, height: 16), leftImage: "", rightImage: "SaoyiSaoIcon")
        getHomeRequest()
        setUPRefresh()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension SheUpHomeViewController{
    func getHomeRequest() {
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.show(withStatus: "正在加载...")
//        let now = Date()
//        let timeInterval:TimeInterval = now.timeIntervalSince1970
//        let timeStamp = Int(timeInterval)
        let timeStamp = "1514874770"
//        let version = versionCheck()
//        let param1 = ["city":"cd","version":version,"platform":"ios","time":timeStamp] as [String : Any]
        
//        let ency = encryptionFile()
//        let signDa = ency .md5WithDict(params: param1 as [String : AnyObject])
        let signDa = "Sbl1jZj20/uUXE2E5/y5pQtKK0Y1wcSgqvxzljw3aCsWcrnmvtc+iimvCZUSet39Gih93+omxYcHunVNA7tNuYp6zb9q+Qpe2BgCNzrOHqnRo4T+9IdGayH076akeVqa"
        
        let param = ["city":"cd","version":"3.0.0","platform":"ios","time":timeStamp,"SignData":signDa] as [String : Any]
        
        let url = "https://api.sheup.club/api/index/home"
        
        Alamofire.request(url, method: .post, parameters: param).responseJSON { (responseJson) in
            switch responseJson .result.isSuccess {
            case true :
                if let dicResult = responseJson.result.value {
                    SVProgressHUD.setDefaultStyle(.light)
                    SVProgressHUD .dismiss()
                    self.tableView?.mj_header.endRefreshing()
                    self.topArray .removeAll()
                    self.middleArray.removeAll()
                    self.bottomArray.removeAll()
                    let res = dicResult as! [String:AnyObject]
                    guard let result = res["result"],let index_top = result["index_top"],let middle = result["index_middle_topic"],let bottom = result["index_bottom"] else{
                        return
                    }
                    let indexTopArr = index_top as! [[String:AnyObject]]
                    for dict in indexTopArr {
                        let mainMode = SheUpMainModel()
                        mainMode.yy_modelSet(with: dict )
                        let viewModel = SheUpMainViewModel(model: mainMode)
                        self.topArray.append(viewModel)
                    }
                    let middleArr = middle as! [[String:AnyObject]]
                    for dict in middleArr {
                        let mainMode = SheUpMainModel()
                        mainMode.yy_modelSet(with: dict )
                        let viewModel = SheUpMainViewModel(model: mainMode)
                        self.middleArray.append(viewModel)
                    }
                    let bottomArr = bottom as! [[String:AnyObject]]
                    for dict in bottomArr {
                        let mainMode = SheUpMainModel()
                        mainMode.yy_modelSet(with: dict )
                        let viewModel = SheUpMainViewModel(model: mainMode)
                        self.bottomArray.append(viewModel)
                    }
                    self.tableView?.reloadData()
                }
            case false :
                SVProgressHUD.showInfo(withStatus: responseJson.result.error as! String)
            }
        }
    }
}

extension SheUpHomeViewController{
    override func setUpTableView() {
        super.setUpTableView()
        tableView?.register(SheUpMainTopCell.self, forCellReuseIdentifier: topCellId)
        tableView?.register(SheUpMiddleTableViewCell.self, forCellReuseIdentifier: middleCellId)
        tableView?.register(SheUpBottomTableViewCell.self, forCellReuseIdentifier: bottomCellId)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if topArray.count > 0 {
                return 1
            }else{
                return 0
            }
        }else if section == 1{
         return middleArray.count
        }else{
          return bottomArray.count
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: topCellId, for: indexPath) as! SheUpMainTopCell
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.orange
            cell .getImageWithArray(array: topArray)
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: middleCellId, for: indexPath) as! SheUpMiddleTableViewCell
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            let viewModel = middleArray[indexPath.row]
            cell .showDataWithViewModel(viewModel: viewModel, index: indexPath.row)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: bottomCellId, for: indexPath) as! SheUpBottomTableViewCell
            cell.selectionStyle = .none
            let viewModel = bottomArray[indexPath.row]
            cell .showDataWithModel(viewModel: viewModel)
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if topArray.count > 0{
                let viewModel = topArray[indexPath.row]
                let height = viewModel .caculateRowHeight(model: viewModel.mainModel)
                return height
            }else{
                return 0.01
            }
        }else if indexPath.section == 1 {
            if middleArray.count > 0 {
                return 100
            }else{
              return 0.01
            }
        }else{
            if bottomArray.count>0 {
                let viewModel = bottomArray[indexPath.row]
                let height = viewModel .caculateRowHeight(model: viewModel.mainModel)
                return height + 10
            }else{
              return 0.01
            }
        }
    }
}
extension SheUpHomeViewController{
    func setUPRefresh() {
        //下拉刷新
        header.setRefreshingTarget(self, refreshingAction: #selector(test))
        self.tableView?.mj_header = header
    }
    @objc func test(){
        getHomeRequest()
    }
}














