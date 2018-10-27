//
//  ViewController.swift
//  homework3
//
//  Created by 王春杉 on 2018/10/26.
//  Copyright © 2018 王春杉. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sectionArray = [String]()
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.title = "通讯录"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContact))
        
        sectionArray = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isEditing = true
        view.addSubview(tableView)
    }

    // 添加 新建联系人 页面
    @objc func addContact() {
        self.navigationController?.pushViewController(AddContactController(), animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "123")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "123")
            cell?.textLabel?.text = "hello"
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionArray
    }
    
    // 编辑实现
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
}

