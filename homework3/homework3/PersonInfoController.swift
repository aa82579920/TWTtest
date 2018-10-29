//
//  PersonInfoController.swift
//  homework3
//
//  Created by 王春杉 on 2018/10/29.
//  Copyright © 2018 王春杉. All rights reserved.
//

import UIKit
class PersonInfoController: UIViewController {
    var editBarBtn = UIBarButtonItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //编辑按钮初始化
        editBarBtn = UIBarButtonItem(title: "编辑", style: .done, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = editBarBtn
    }
}
