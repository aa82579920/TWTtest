//
//  main.swift
//  person
//
//  Created by 王春杉 on 2018/10/3.
//  Copyright © 2018年 王春杉. All rights reserved.
//

import Foundation

class Person{
    let name:String
    let sex:String
    var age:Int
    var height:Int
    var weight:Int
    
    init(name:String,sex:String,age:Int,height:Int,weight:Int) {
        self.name = name
        self.sex = sex
        self.age = age
        self.height = height
        self.weight = weight
    }
    
    
}

class Teacher: Person {
    var subject:String
    
    init(name:String,sex:String,age:Int,height:Int,weight:Int
        ,subject:String) {
        self.subject = subject
        super.init(name: name, sex: sex, age: age, height: height,weight:weight)
    }
    //返回Teacher的BMI
    func getBMI() -> Int {
        return self.weight/(self.height*self.height)
    }
    //返回两个Teacher的身高差
    static func getHeightDiff(Teacher1:Teacher,Teacher2:Teacher) ->
        Int {
            return abs(Teacher1.height-Teacher2.height)
    }
}

class Student: Person {
    var grade:Int
    var major:String
    var GPA:Double
    
    init(name: String, sex: String, age: Int, height: Int, weight:Int, grade:Int, major:String, GPA:Double) {
        self.grade = grade
        self.major = major
        self.GPA = GPA
        
        super.init(name: name, sex: sex, age: age, height: height, weight: weight)
    }
    //返回多个学生的GPA平均值
    static func getGPAmean(_ Students: Student...) -> Double {
        var total = 0.0
        for student in Students {
            total += student.GPA
        }
        return total/Double(Students.count)
    }
}


//测试
//mPerson
print("This is a person")
var mPerson = Person(name: "LaoWang", sex: "man", age: 18, height: 180, weight: 160)
print("姓名：\(mPerson.name)\n性别：\(mPerson.sex)\n年龄：\(mPerson.age)\n身高：\(mPerson.height)\n体重：\(mPerson.weight)")
print("")
//mTeacher
print("This is a teacher")
var mTeacher1 = Teacher(name: "LaoWang1", sex: "man", age: 18, height: 180, weight: 160, subject: "Math")
var mTeacher2 = Teacher(name: "LaoWang2", sex: "man", age: 18, height: 180, weight: 160, subject: "English")
print("Teacher1的BMI: \(Teacher.getBMI(mTeacher1))")
print("Teacher1与Teacher2的身高差: \(Teacher.getHeightDiff(Teacher1: mTeacher1, Teacher2: mTeacher2))")
print("")


//mStudent
print("This is a student")
var mStudent1 = Student(name: "xiaoMing", sex: "man", age: 19, height: 160, weight: 160, grade: 1, major: "css", GPA: 1.0)
var mStudent2 = Student(name: "xiaoHong", sex: "man", age: 19, height: 190, weight: 180, grade: 1, major: "cs", GPA: 3.0)
print("学生的GPA平均值: \(Student.getGPAmean(mStudent1, mStudent2))")

