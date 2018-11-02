//
//  ViewController.swift
//  homework3
//
//  Created by 王春杉 on 2018/10/26.
//  Copyright © 2018 王春杉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Section标题 及 索引标题
    var sectionArray: [String] {
        var sectionArray = [String]()
        for index in 0..<26 {
            sectionArray.append(String(UnicodeScalar(index + 65)!))
        }
        return sectionArray
    }
    var tableView = UITableView()
    var leftBarBtn = UIBarButtonItem()
    let userDelaults = UserDefaults.standard
    var sectionCount = 0
    var data: [[PersonInfo]]?
    var cellsOfSection: [Int]?
    var showSectionArray: [Int]?
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        dataInit()
        sectionCount = 0
        showSectionArray = [Int]()
        for i in 0..<PersonFigure.counts {
            let nowPersonData = userDelaults.data(forKey: "\(i+1)")
            let nowPerson = NSKeyedUnarchiver.unarchiveObject(with: nowPersonData!) as! PersonInfo
            data![nowPerson.nameAscll].append(nowPerson)
        }
        for i in 0...25 {
            let array = data?[i]
            if (array?.count)! > 0 {
                sectionCount += 1
                showSectionArray?.append(i)  // 记录可以显示的section
            }
        }
        tableView.reloadData()
    }

    // 添加 新建联系人 页面
    @objc func addContact() {
        self.navigationController?.pushViewController(AddContactController(), animated: true)
    }
    // 初始化Data数据
    func dataInit() {
        data = [[PersonInfo]]()
        for _ in 1...26 {
            let cells = [PersonInfo]()
            data!.append(cells)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    // 设置Sections数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionCount
    }
    // 设置cell数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sectionCount > 0 {
            return data![showSectionArray![section]].count
        }
        return 0
    }
    // 设置每个Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let thePerson = data![indexPath.section][indexPath.row]
        let name = thePerson.name

        var cell = tableView.dequeueReusableCell(withIdentifier: "123")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "123")
            cell?.textLabel?.text = name
        }
        return cell!
    }
    
}

extension ViewController: UITableViewDelegate {
    
    // 设置每个Section标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray[showSectionArray![section]]
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
    // 为cell添加点击方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        PersonFigure.section = indexPath.section
        PersonFigure.row = indexPath.row
        // 弹出详细页
        self.navigationController?.pushViewController(PersonInfoController(), animated: true)
    }
}

