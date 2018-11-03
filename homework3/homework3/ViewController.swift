//
//  ViewController.swift
//  homework3
//
//  Created by 王春杉 on 2018/10/26.
//  Copyright © 2018 王春杉. All rights reserved.
//

import UIKit
struct Datas {
    static var data: [[PersonInfo]]?
    static var showSectionArray: [Int]?
}
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
    let userDefaults = UserDefaults.standard
    var sectionCount = 0
    var cellsOfSection: [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.title = "通讯录"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContact))

        tableView = UITableView(frame: view.bounds, style: .plain)
        
        tableView.dataSource = self
        tableView.delegate = self
        serchBar()
        view.addSubview(tableView)
    }
    // MARK: -视图重新出现
    override func viewWillAppear(_ animated: Bool) {
        dataInit()
        sectionCount = 0
        Datas.showSectionArray = [Int]()
        for i in 0..<PersonFigure.counts {
            let nowPersonData = userDefaults.data(forKey: "\(i+1)")
            let nowPerson = NSKeyedUnarchiver.unarchiveObject(with: nowPersonData!) as! PersonInfo
            
            let name = nowPerson.name
            // 获取名字的第一个字母Ascll
            let nameFirst: Character = name[name.startIndex]
            var nameAscll: UInt32 = 0
            for code in nameFirst.unicodeScalars {
                nameAscll = code.value
            }
            nameAscll = nameAscll-65
            Datas.data![Int(nameAscll)].append(nowPerson)
        }
        for i in 0...25 {
            let array = Datas.data?[i]
            if (array?.count)! > 0 {
                sectionCount += 1
                Datas.showSectionArray?.append(i)  // 记录可以显示的section
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
        Datas.data = [[PersonInfo]]()
        for _ in 1...26 {
            let cells = [PersonInfo]()
            Datas.data!.append(cells)
        }
    }
    // 设置搜索框
    func serchBar() {
        let bar = UISearchBar(frame: CGRect(x: 30, y: 0, width: Device.width, height: 44))
        // 将搜索框视图设置为tableView的tableHeaderView
        tableView.tableHeaderView = bar
        // 样式
        bar.barStyle = .default
        // 设置代理
        bar.delegate = self
        bar.placeholder = "搜索"
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
            return Datas.data![Datas.showSectionArray![section]].count
        }
        return 0
    }
    // 设置每个Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let thePerson = Datas.data![Datas.showSectionArray![indexPath.section]][indexPath.row]
        let name = thePerson.name

        var cell = tableView.dequeueReusableCell(withIdentifier: "\(name)")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "\(name)")
            cell?.textLabel?.text = name
        }else {
            cell?.textLabel?.text = name
        }
        return cell!
    }
    
}

extension ViewController: UITableViewDelegate {
    
    // 设置每个Section标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray[Datas.showSectionArray![section]]
    }
    // 设置索引内容
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionArray
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        // 获取名字的第一个字母Ascll
        let nameFirst: Character = title[title.startIndex]
        var nameAscll: UInt32 = 0
        for code in nameFirst.unicodeScalars {
            nameAscll = code.value
        }
        nameAscll = nameAscll-65
        var theSection = 0
        for i in 0..<Datas.showSectionArray!.count {
            if Datas.showSectionArray![i] == nameAscll {
                theSection = i
            }
        }
        let path = IndexPath(row: 0, section: theSection)
        // 滚动
        tableView.scrollToRow(at: path, at: .top, animated: true)
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

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            self.viewWillAppear(true)
            print("---")
        }else {
            dataInit()
            sectionCount = 1
            Datas.showSectionArray = [Int]()
            for i in 0..<PersonFigure.counts {
                let nowPersonData = userDefaults.data(forKey: "\(i+1)")
                let nowPerson = NSKeyedUnarchiver.unarchiveObject(with: nowPersonData!) as! PersonInfo
                if nowPerson.name.lowercased().hasPrefix(searchText.lowercased()) {
                    let name = nowPerson.name
                    // 获取名字的第一个字母Ascll
                    let nameFirst: Character = name[name.startIndex]
                    var nameAscll: UInt32 = 0
                    for code in nameFirst.unicodeScalars {
                        nameAscll = code.value
                    }
                    nameAscll = nameAscll-65
                    Datas.data![Int(nameAscll)].append(nowPerson)
                    Datas.showSectionArray?.append(Int(nameAscll))
                    tableView.reloadData()
                }
            }
        }
    }
}
