//
//  SheUpMineViewController.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2017/12/26.
//  Copyright © 2017年 sweet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher
import RxDataSources
class SheUpMineViewController: UIViewController {
     let topCellId:String = "minTop"
    let cellId:String = "custom"
    var tableView:UITableView!
    var topCell:SheUpTableViewCell?
    var bottomCell : UITableViewCell?
    
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = RGB(r: 241, g: 241, b: 241)
        setNavigationBar()
        createTableView()
        
        let items = Observable.just([
            SectionModel(
                //section = 0
                model: Province("河南省"),
                items: [ City(title: "我的关注",imageName: "MyFocus")]
            ),
            SectionModel(
                model: Province("河南省"),
                items: [ City(title: "我的关注",imageName: "MyFocus")]
            ),
            SectionModel(
                model: Province("广东省"),
                items: [ City(title: "我的活动",imageName: "MyActivityIcon")]
            ),
            SectionModel(
                model: Province("辽宁省"),
                items: [ City(title: "我的话题",imageName: "MyTopic")]
            ),
            SectionModel(
                model: Province("辽宁省"),
                items: [ City(title: "     设置",imageName: "1")]
            ),
            SectionModel(
                model: Province("辽宁省"),
                items: [ City(title: "     建议",imageName: "1")]
            ),
            SectionModel(
                model: Province("辽宁省"),
                items: [ City(title: "     联系我们",imageName: "1")]
            )
            ])
        /*let items = Observable.of([
            City(title:"我的关注",imageName:"MyFocus"),
            City(title:"我的关注",imageName:"MyFocus"),
            City(title:"我的活动",imageName:"MyActivityIcon"),
            City(title:"我的话题",imageName:"MyTopic"),
            City(title:"设置",imageName:"1"),
            City(title:"建议",imageName:"1"),
            City(title:"联系我们",imageName:"1"),
            ])*/
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<Province,City>>(configureCell: { (data,table,index,city) in
            if index.section == 0 {
                let cell = table.dequeueReusableCell(withIdentifier: self.cellId, for: index) as! SheUpTableViewCell
                cell.loginButton.rx.tap .subscribe(onNext: { (event) in
//                    print(event)
                    let sehupLogin = SheUpLoginViewController()
                   sehupLogin.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(sehupLogin, animated: true)
                }).disposed(by: self.disposeBag)
//                cell.loginButton.rx.tap.map{"测"}.subscribe{
//                    print($0)
//                    }.disposed(by: self.disposeBag)
                cell.backgroundColor = UIColor.orange
                return cell
                
            }else{
                let cell = table.dequeueReusableCell(withIdentifier: self.topCellId, for: index)
                cell.imageView?.image = UIImage(named: city.imageName)
                cell.textLabel?.text = city.title
                return cell
                
            }
        })
        items.asDriver(onErrorJustReturn: []).drive(tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

private extension SheUpMineViewController{
    func setNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 223/255, green: 19/255, blue: 108/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
    }
    func createTableView() {
        tableView = UITableView()
        tableView.backgroundColor = UIColor.white
        self.view.addSubview(tableView)

        tableView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: topCellId)
        tableView.register(SheUpTableViewCell.self, forCellReuseIdentifier: cellId)
    }
}
extension SheUpMineViewController{
    func getMineData() {
    }
}
extension SheUpMineViewController{
    
    func demo() {
        /*items.asDriver(onErrorJustReturn: [])
         .drive(tableView.rx.items(cellIdentifier: cellId)){index,city,cell in
         cell.selectionStyle = .none
         }.disposed(by: disposeBag)
         
         tableView.rx.modelSelected(City.self).subscribe({
         print($0)
         }).disposed(by: disposeBag)
         items.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
         
         dataSource.titleForHeaderInSection = {
         (dataSource,sectionIndex) in
         return dataSource[sectionIndex].model.title
         }
         //将数据组和dataSource进行绑定
         //
         
         items.asObservable().bindTo(tableView.rx.items(cellIdentifier: SheUpTableViewCell.reuseIdentifier, cellType: SheUpTableViewCell.self)) { row, data, cell in
         
         cell.data = data
         }.addDisposableTo(disposeBag)
         
         //监听cell的点击事件
         tableView.rx.itemSelected.map{
         indexpath in
         return (indexpath,dataSource[indexpath])
         }.subscribe(onNext: { (indexPath,city) in
         print("\(indexPath)+\(city.title)")
         }).disposed(by: disposeBag)*/
    }
}
