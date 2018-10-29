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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "新建联系人"
        
        //完成按钮
        finishBarBtn = UIBarButtonItem(title: "完成", style: .plain, target: self, action: #selector(finishBtn))
        self.navigationItem.rightBarButtonItem = finishBarBtn
    }
    
    @objc func finishBtn() {
        self.navigationController?.popViewController(animated: true)
    }
}

