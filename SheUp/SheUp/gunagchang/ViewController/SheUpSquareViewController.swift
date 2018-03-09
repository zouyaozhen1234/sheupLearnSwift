//
//  SheUpSquareViewController.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2017/12/26.
//  Copyright © 2017年 sweet. All rights reserved.
//

import UIKit

class SheUpSquareViewController: SheUpBaseViewController {
    private let topCellID = "cellId";
    private let middleCellId = "middleCellId"
    private let bottomCellID = "bottomCellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension SheUpSquareViewController{
    
    override func setUpTableView() {
        super.setUpTableView()
        tableView?.register(SheUpTableViewTopCell.self, forCellReuseIdentifier: topCellID)
        tableView?.register(SheUpTableViewCenterCell.self, forCellReuseIdentifier: middleCellId)
        tableView?.register(SheUpTableViewBottomCell.self, forCellReuseIdentifier: bottomCellID)
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1{
            return 3
        }else{
            return 5
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: topCellID, for: indexPath) as! SheUpTableViewTopCell
            cell.backgroundColor = UIColor.white
            return cell
        }else if indexPath.section < 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: middleCellId, for: indexPath) as! SheUpTableViewCenterCell
            cell.backgroundColor = UIColor.white
            return cell
        }
            
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: bottomCellID, for: indexPath) as! SheUpTableViewBottomCell
            cell.backgroundColor = UIColor.white
            return cell
        }
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 210
        }
        else if indexPath.section == 1 {
            return 100
        }
        else{
            return 150
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}

