//
//  ViewController.swift
//  homework2
//
//  Created by 王春杉 on 2018/10/15.
//  Copyright © 2018年 王春杉. All rights reserved.
//

import UIKit
// 获取屏幕宽度
struct Device {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}
class ViewController: UIViewController {

    
    let imageView = UIImageView()
    let topBtn = UIButton()
    let bottomBtn = UIButton()
    let leftBtn = UIButton()
    let rightBtn = UIButton()
    let returnBtn = UIButton()
    let bigBtn = UIButton()
    let smallBtn = UIButton()
    let CWBtn = UIButton()
    let ACWBtn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(Device.width, Device.height)
        //width: 414.0 height: 896.0
        self.view.backgroundColor = UIColor.white
        
        var btnArray = [topBtn, bottomBtn, leftBtn, rightBtn, returnBtn, bigBtn, smallBtn, ACWBtn, CWBtn]
        imageView.frame.size = CGSize(width: Device.width / 4, height: Device.width / 4)
        imageView.image = #imageLiteral(resourceName: "emoji")
        imageView.center = CGPoint(x: Device.width / 2, y: Device.height / 4)
        view.addSubview(imageView)
        // MARK: -初始化所有按钮
        for i in 0...8 {
            if i <= 4 {
                btnArray[i].frame.size = CGSize(width: Device.width*64/414, height: Device.width*64/414)
            }else {
                btnArray[i].frame.size = CGSize(width: Device.width*50/414, height: Device.width*50/414)
            }
            if i == 8 {
                topBtn.setBackgroundImage(#imageLiteral(resourceName: "top"), for: .normal)
                bottomBtn.setBackgroundImage(#imageLiteral(resourceName: "bottom"), for: .normal)
                leftBtn.setBackgroundImage(#imageLiteral(resourceName: "left"), for: .normal)
                rightBtn.setBackgroundImage(#imageLiteral(resourceName: "right"), for: .normal)
                returnBtn.setBackgroundImage(#imageLiteral(resourceName: "btn"), for: .normal)
                CWBtn.setBackgroundImage(#imageLiteral(resourceName: "CW"), for: .normal)
                ACWBtn.setBackgroundImage(#imageLiteral(resourceName: "ACW"), for: .normal)
                bigBtn.setBackgroundImage(#imageLiteral(resourceName: "up"), for: .normal)
                smallBtn.setBackgroundImage(#imageLiteral(resourceName: "down"), for: .normal)
                topBtn.center = CGPoint(x: Device.width - Device.width*300/414, y: Device.height - Device.height*320/890)
                bottomBtn.center = CGPoint(x: Device.width - Device.width*300/414, y: Device.height - Device.height*180/890)
                leftBtn.center = CGPoint(x: Device.width - Device.width*370/414, y: Device.height - Device.height*250/890)
                rightBtn.center = CGPoint(x: Device.width - Device.width*230/414, y: Device.height - Device.height*250/890)
                returnBtn.center = CGPoint(x: Device.width - Device.width*300/414, y: Device.height - Device.height*250/890)
                CWBtn.center = CGPoint(x: Device.width - Device.width*140/414, y: Device.height - Device.height*280/890)
                ACWBtn.center = CGPoint(x: Device.width - Device.width*60/414, y: Device.height - Device.height*280/890)
                bigBtn.center = CGPoint(x: Device.width - Device.width*140/414, y: Device.height - Device.height*210/890)
                smallBtn.center = CGPoint(x: Device.width - Device.width*60/414, y: Device.height - Device.height*210/890)
            }
            btnArray[i].addTarget(self, action: #selector(click), for: .touchUpInside)
            view.addSubview(btnArray[i])
        }
    }
    
    //MARK: -所有Button的点击事件函数
    @objc func click(button:UIButton) {
        switch button {
        case topBtn:
            UIView.animate(withDuration: 0.5) {
                self.imageView.center = CGPoint(x: self.imageView.center.x, y: self.imageView.center.y - Device.width/9)
            }
        case bottomBtn:
            UIView.animate(withDuration: 0.5) {
                self.imageView.center = CGPoint(x: self.imageView.center.x, y: self.imageView.center.y + Device.width/9)
            }
        case leftBtn:
            UIView.animate(withDuration: 0.5) {
                self.imageView.center = CGPoint(x: self.imageView.center.x - Device.width/9, y: self.imageView.center.y)
            }
        case rightBtn:
            UIView.animate(withDuration: 0.5) {
                self.imageView.center = CGPoint(x: self.imageView.center.x + Device.width/9, y: self.imageView.center.y)
            }
        case returnBtn:
            UIView.animate(withDuration: 0.5) {
                self.imageView.center = CGPoint(x: Device.width / 2, y: Device.height / 4)
                self.imageView.transform = __CGAffineTransformMake(1, 0, 0, 1, 0, 0)
            }
        case bigBtn:
            UIView.animate(withDuration: 0.5) {
                self.imageView.transform = __CGAffineTransformMake(self.imageView.transform.a+0.5, 0, 0, self.imageView.transform.d+0.5, 0, 0)
            }
        case smallBtn:
            UIView.animate(withDuration: 0.5) {
                self.imageView.transform = __CGAffineTransformMake(self.imageView.transform.a-0.5, 0, 0, self.imageView.transform.d-0.5, 0, 0)
            }
        case CWBtn:
            UIView.animate(withDuration: 0.5) {
                self.imageView.transform = self.imageView.transform.rotated(by: CGFloat(Double.pi/4*2))
            }
        case ACWBtn:
            UIView.animate(withDuration: 0.5) {
                self.imageView.transform = self.imageView.transform.rotated(by: CGFloat(-Double.pi/4*2))
            }
        default:
            print("default!")
        }
    }
}

