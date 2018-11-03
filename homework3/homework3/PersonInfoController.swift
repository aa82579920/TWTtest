//
//  PersonInfoController.swift
//  homework3
//
//  Created by 王春杉 on 2018/10/29.
//  Copyright © 2018 王春杉. All rights reserved.
//
struct Device {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}

struct PersonFigure {
    static var section = 0
    static var row = 0
    static var counts = UserDefaults.standard.integer(forKey: "personCount")
}

import UIKit
class PersonInfoController: UIViewController {
    var editBarBtn = UIBarButtonItem()
    var nameLable: UILabel?
    var phoneLable: UILabel?
    var userDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        userDefaults = UserDefaults.standard
        //编辑按钮初始化
        editBarBtn = UIBarButtonItem(title: "编辑", style: .done, target: self, action: #selector(editBar))
        self.navigationItem.rightBarButtonItem = editBarBtn
        
        nameLable = UILabel(frame: CGRect(x: 80, y: 80, width: Device.width-160, height: 40))
        phoneLable = UILabel(frame: CGRect(x: 80, y: 140, width: Device.width-160, height: 40))
        view.addSubview(nameLable!)
        view.addSubview(phoneLable!)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        let thePerson = Datas.data![Datas.showSectionArray![PersonFigure.section]][PersonFigure.row]
        let nowPersonData = userDefaults.data(forKey: "\(thePerson.num)")
        let nowPerson = NSKeyedUnarchiver.unarchiveObject(with: nowPersonData!) as! PersonInfo
        nameLable?.text = nowPerson.name
        phoneLable?.text = nowPerson.phone
        
    }
    @objc func editBar() {
        self.navigationController?.pushViewController(EditController(), animated: true)
        EditPerson.name = nameLable?.text
        EditPerson.phone = phoneLable?.text
    }
}
