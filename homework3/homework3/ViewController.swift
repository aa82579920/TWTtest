//
//  ViewController.swift
//  homework3
//
//  Created by 王春杉 on 2018/10/26.
//  Copyright © 2018 王春杉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sectionArray: [String] {
        var sectionArray = [String]()
        for index in 0..<26 {
            sectionArray.append(String(UnicodeScalar(index + 65)!))
        }
        return sectionArray
    } // Section标题 及 索引标题
    var tableView = UITableView()
    var leftBarBtn = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.title = "通讯录"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContact))
        
       
        tableView = UITableView(frame: view.bounds)
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }

    // 添加 新建联系人 页面
    @objc func addContact() {
        self.navigationController?.pushViewController(AddContactController(), animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    
    // 设置Sections数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    // 设置cell数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    // 设置每个Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "123")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "123")
            cell?.textLabel?.text = "hello"
        }
        return cell!
    }
    
}

extension ViewController: UITableViewDelegate {
    
    // 设置每个Section标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray[section]
    }
    // 设置索引内容
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionArray
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        let path = IndexPath(row: 0, section: index)
        // 滚动
        tableView.scrollToRow(at: path, at: .bottom, animated: true)
        return index
    }
    //为cell添加点击方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(PersonInfoController(), animated: true)
    }
}

class PersonInfo {
    var name: String
    var phoneNum: [String]
    var remark: String?
    var photo: UIImage?
    
    init(name: String, phoneNum: [String]) {
        self.name = name
        self.phoneNum = phoneNum
    }
}
