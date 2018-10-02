//
//  main.swift
//  rectangle
//
//  Created by 王春杉 on 2018/10/2.
//  Copyright © 2018年 王春杉. All rights reserved.
//

import Foundation
struct Node{
    var x:Int
    var y:Int
    
    init(x:Int,y:Int) {
        self.x=x
        self.y=y
    }
}

struct Rectangle{
    var center:Node
    var grith:Int
    var area:Int
    
    var nodeA:Node  //矩形左上角
    var nodeC:Node  //矩形右下角
    
    init(nodeA:Node, nodeC:Node) {
        self.nodeA = nodeA
        self.nodeC = nodeC
        let length = nodeC.x-nodeA.x
        let width = nodeA.y-nodeC.y
        self.center = Node(x: nodeA.x+length/2, y: nodeA.y-width/2)
        grith = (length+width)*2
        area = length*width
    }
    
    func getNodeArray() -> [Node] {
        let length = nodeC.x-nodeA.x
        let width = nodeA.y-nodeC.y
        let nodeB = Node(x: nodeA.x+length, y: nodeA.y)
        let nodeD = Node(x: nodeC.x-length, y: nodeC.y)
        let array:[Node] = [nodeA,nodeB,nodeC,nodeD]
        return array
    }
    
    static func getGrithDiff(rec1:Rectangle,rec2:Rectangle) -> Int {
        return abs(rec1.grith-rec2.grith)
    }
    
    static func getAreaDiff(rec1:Rectangle,rec2:Rectangle) -> Int {
        return abs(rec1.area-rec2.area)
    }
}

//测试
var rec1 = Rectangle(nodeA: Node(x: 1, y: 3), nodeC: Node(x: 5, y: 0))
var rec2 = Rectangle(nodeA: Node(x: 2, y: 3), nodeC: Node(x: 4, y: 0))

print(rec1.getNodeArray())
print(Rectangle.getGrithDiff(rec1: rec1, rec2: rec2))
print(Rectangle.getAreaDiff(rec1: rec1, rec2: rec2))
