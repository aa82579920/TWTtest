//
//  AddContactController.swift
//  homework3
//
//  Created by 王春杉 on 2018/10/26.
//  Copyright © 2018 王春杉. All rights reserved.
//

import UIKit
class AddContactController: UIViewController {
    
    var finishBarBtn = UIBarButtonItem()
    var nameField = UITextField()
    var phoneNumField = UITextField()
    let userDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "新建联系人"
        
        //完成按钮
        finishBarBtn = UIBarButtonItem(title: "完成", style: .plain, target: self, action: #selector(finishBtn))
        self.navigationItem.rightBarButtonItem = finishBarBtn
        
        //输入姓名
        nameField = UITextField(frame: CGRect(x: 80, y: 80, width: Device.width-160, height: 40))
        nameField.borderStyle = .roundedRect
        nameField.placeholder = "请输入姓名:"
        view.addSubview(nameField)
        
        // 输入电话
        phoneNumField = UITextField(frame: CGRect(x: 80, y: 140, width: Device.width-160, height: 40))
        phoneNumField.borderStyle = .roundedRect
        phoneNumField.placeholder = "请输入电话:"
        view.addSubview(phoneNumField)
        
    }
    
    @objc func finishBtn() {
        let name: String? = nameField.text
        let phoneNum: String? = phoneNumField.text
        PersonFigure.counts += 1
        userDefaults.set(PersonFigure.counts, forKey: "personCount")

        let person = PersonInfo(name: name!, phone: phoneNum!, num: "\(PersonFigure.counts)")
        //实例对象转换成Data
        let personData = NSKeyedArchiver.archivedData(withRootObject: person)
        //存储Data对象
        userDefaults.set(personData, forKey: "\(PersonFigure.counts)")
        userDefaults.synchronize()
        self.navigationController?.popViewController(animated: true)
    }
}

