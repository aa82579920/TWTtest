//
//  main.swift
//  test1_sort
//
//  Created by 王春杉 on 2018/10/2.
//  Copyright © 2018年 王春杉. All rights reserved.
//

import Foundation

//Int型升序排序
func bubbleSort(array:inout[Int]){
    var i = 1
    while i < array.count {
        var j = array.count-1
        while j >= i {
            if array[j-1] > array[j] {
                let temp = array[j-1]
                array[j-1] = array[j]
                array[j] = temp
            }
            j-=1
        }
        i += 1
    }
}
//Int型升序直接插入排序
func In_placeSort(array:inout[Int]) {
    var i=1
    var j:Int
    var key:Int
    while i<array.count {
        key = array[i]
        j = i-1
        while j>=0 && array[j]>key{
            array[j+1] = array[j]
            j -= 1
        }
        array[j+1] = key
        i += 1
    }
}

//测试
var testArray1:[Int]? = [1,3,5,7,9,2,4,6,8]
print("排序前：\(testArray1!)")
if var array1=testArray1 {
    bubbleSort(array: &array1)
    print("冒泡排序后：\(array1)")
}else{
    print("0")
}

var testArray2:[Int]? = [1,3,5,7,9,2,4,6,8]
print("排序前：\(testArray2!)")
if var array2=testArray2 {
    In_placeSort(array: &array2)
    print("插入排序后：\(array2)")
}else{
    print("0")
}
