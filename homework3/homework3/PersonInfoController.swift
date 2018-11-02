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
    static var counts = 0
}

import UIKit
class PersonInfoController: UIViewController {
    var editBarBtn = UIBarButtonItem()
    var nameLable: UILabel?
    var phoneLable: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //编辑按钮初始化
        editBarBtn = UIBarButtonItem(title: "编辑", style: .done, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = editBarBtn
        
        nameLable = UILabel(frame: CGRect(x: 80, y: 80, width: Device.width-160, height: 40))
        phoneLable = UILabel(frame: CGRect(x: 80, y: 140, width: Device.width-160, height: 40))
        
        
        view.addSubview(nameLable!)
        view.addSubview(phoneLable!)
    }
}
