//
//  SheUpBaseViewController.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2017/12/26.
//  Copyright © 2017年 sweet. All rights reserved.
//

import UIKit
class SheUpBaseViewController: UIViewController {
    var tableView : UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setUpTableView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
extension  SheUpBaseViewController {

    private func setNavigationBar(){
     self.navigationController?.navigationBar.barTintColor = UIColor(red: 223/255, green: 19/255, blue: 108/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
    }
    @objc dynamic  func createLeftAndRightItem(leftRect:CGRect,rightRect:CGRect,leftImage:String,rightImage:String) {
        
        let leftBtn = UIButton(type: .custom)
        leftBtn.frame  = leftRect
        leftBtn .setBackgroundImage(UIImage(named: leftImage), for: .normal)
        leftBtn.tag = 100
        leftBtn.addTarget(self, action: #selector(NavigationBarButtonClick(button:)), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        let rightBtn = UIButton(type: .custom)
        rightBtn.frame = rightRect
        rightBtn.tag = 101
        rightBtn.setBackgroundImage(UIImage(named: rightImage), for: .normal)
        self.navigationItem.rightBarButtonItem  = UIBarButtonItem(customView: rightBtn)
    }
    @objc func NavigationBarButtonClick(button:UIButton){
        if button.tag == 100 {
           self.navigationController?.popViewController(animated: true)
        }else{
            
        }
    }
    
   @objc dynamic func setUpTableView() {
        
    tableView = UITableView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64-49), style: .plain)
    tableView?.separatorStyle = .none
    tableView?.dataSource  = self
    tableView?.delegate  = self
    view.addSubview(tableView!)
    }

}
extension SheUpBaseViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
}

