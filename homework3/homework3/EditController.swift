//
//  EditController.swift
//  homework3
//
//  Created by 王春杉 on 2018/11/3.
//  Copyright © 2018 王春杉. All rights reserved.
//

import UIKit
struct EditPerson {
    static var name: String?
    static var phone: String?
}
class EditController: UIViewController {
    var offBar = UIBarButtonItem()
    var finishBar = UIBarButtonItem()
    var nameField = UITextField()
    var phoneNumField = UITextField()
    let userDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        offBar = UIBarButtonItem(title: "取消", style: .done, target: self, action: #selector(offClick))
        self.navigationItem.leftBarButtonItem = offBar
        
        finishBar = UIBarButtonItem(title: "完成", style: .done, target: self, action: #selector(finishClick))
        self.navigationItem.rightBarButtonItem = finishBar
        
        //输入姓名
        nameField = UITextField(frame: CGRect(x: 80, y: 80, width: Device.width-160, height: 40))
        nameField.borderStyle = .roundedRect
        nameField.text = EditPerson.name!
        view.addSubview(nameField)
        
        // 输入电话
        phoneNumField = UITextField(frame: CGRect(x: 80, y: 140, width: Device.width-160, height: 40))
        phoneNumField.borderStyle = .roundedRect
        phoneNumField.text = EditPerson.phone!
        view.addSubview(phoneNumField)
    }
    @objc func offClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func finishClick() {
        let thePerson = Datas.data![Datas.showSectionArray![PersonFigure.section]][PersonFigure.row]
        thePerson.name = nameField.text!
        thePerson.phone = phoneNumField.text!
        //实例对象转换成Data
        let personData = NSKeyedArchiver.archivedData(withRootObject: thePerson)
        //存储Data对象
        userDefaults.set(personData, forKey: "\(thePerson.num)")
        userDefaults.synchronize()
        self.navigationController?.popViewController(animated: true)
    }
}
