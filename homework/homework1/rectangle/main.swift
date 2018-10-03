//
//  main.swift
//  rectangle
//
//  Created by 王春杉 on 2018/10/2.
//  Copyright © 2018年 王春杉. All rights reserved.
//

import Foundation
struct Point{
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

struct Rectangle{
    var PointA: Point  //矩形左上角
    var PointC: Point  //矩形右下角
    var center: Point {
        get {
            let length = PointC.x-PointA.x
            let width = PointA.y-PointC.y
            let centerX = PointA.x+length/2
            let centerY = PointA.y-width/2
            return Point(x: centerX, y: centerY)
        }
    }
    var grith: Int {
        let length = PointC.x-PointA.x
        let width = PointA.y-PointC.y
        return (length+width)*2
    }
    var area: Int {
        let length = PointC.x-PointA.x
        let width = PointA.y-PointC.y
        return length*width
    }

    init(PointA: Point, PointC: Point) {
        self.PointA = PointA
        self.PointC = PointC
    }
    
    
    func getPointArray() -> [Point] {
        let length = PointC.x-PointA.x
        let width = PointA.y-PointC.y
        let PointB = Point(x: PointA.x+length, y: PointA.y)
        let PointD = Point(x: PointC.x-length, y: PointC.y)
        let array:[Point] = [PointA,PointB,PointC,PointD]
        return array
    }
    
    static func getGrithDiff(rec1: Rectangle, rec2: Rectangle) -> Int {
        return abs(rec1.grith-rec2.grith)
    }
    
    static func getAreaDiff(rec1: Rectangle, rec2: Rectangle) -> Int {
        return abs(rec1.area-rec2.area)
    }
}

//测试
var rec1 = Rectangle(PointA: Point(x: 1, y: 3), PointC: Point(x: 5, y: 0))
var rec2 = Rectangle(PointA: Point(x: 2, y: 3), PointC: Point(x: 4, y: 0))

print(rec1.getPointArray())
print(Rectangle.getGrithDiff(rec1: rec1, rec2: rec2))
print(Rectangle.getAreaDiff(rec1: rec1, rec2: rec2))
