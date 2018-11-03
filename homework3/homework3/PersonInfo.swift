//
//  PersonInfo.swift
//  homework3
//
//  Created by 王春杉 on 2018/11/2.
//  Copyright © 2018 王春杉. All rights reserved.
//

import UIKit

class PersonInfo: NSObject, NSCoding {
    var name: String
    var phone: String
    var num: String
    // 构造方法
    required init(name: String="", phone: String="", num: String="") {
        self.name = name
        self.phone = phone
        self.num = num
    }
    // 从object解析回来
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "Name") as? String ?? ""
        self.phone = aDecoder.decodeObject(forKey: "Phone") as? String ?? ""
        self.num = aDecoder.decodeObject(forKey: "Num") as? String ?? ""
    }
    // 编码成object
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey:"Name")
        aCoder.encode(phone, forKey:"Phone")
        aCoder.encode(num, forKey:"Num")
    }
}
