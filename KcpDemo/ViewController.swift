//
//  ViewController.swift
//  KcpDemo
//
//  Created by 彭运筹 on 2017/2/8.
//  Copyright © 2017年 peng yun chou. All rights reserved.
//

import UIKit
import SwiftKcp
class ViewController: UIViewController,KcpOutputer {
    var kcp:Kcp! = nil
    var timer:Timer! = nil
    var currentTime:UInt32 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.kcp = Kcp(outputer: self)
        _ = self.kcp.send(data: "hello world".data(using: String.Encoding.utf8)!)
        self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func onTimer(){
        self.currentTime  = self.currentTime + 10
        self.kcp.update(millisec: self.currentTime)
    }
    func kcpOutput() -> Int{
        return 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

