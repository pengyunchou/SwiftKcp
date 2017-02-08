//
//  swiftkcp.swift
//  SwiftKcp
//
//  Created by 彭运筹 on 2017/2/8.
//  Copyright © 2017年 peng yun chou. All rights reserved.
//

import Foundation
import ikcp

public protocol KcpOutputer {
    func kcpOutput() -> Int
}
fileprivate func kcpOutput(a:UnsafePointer<Int8>?,b:Int32,c:UnsafeMutablePointer<IKCPCB>?,d:UnsafeMutableRawPointer?) -> Int32{
    let obj = Unmanaged<Kcp>.fromOpaque(d!)
    obj.takeUnretainedValue().test()
    return 0
}
public class Kcp {
    fileprivate var kcp:UnsafeMutablePointer<ikcpcb>!
    fileprivate var outputer:KcpOutputer!
    fileprivate static var conv:UInt32 = 0
    public init(outputer:KcpOutputer) {
        self.outputer = outputer
        Kcp.conv = Kcp.conv + 1
        var wself = self
        kcp = ikcp_create(Kcp.conv, &wself)
        kcp.pointee.output = kcpOutput
    }
    
    func test()  {
        
    }
    public func update(millisec:UInt32){
        ikcp_update(self.kcp, millisec)
    }
    
    public func send(data:Data) -> Int32{
        return data.withUnsafeBytes { [unowned self](byte:UnsafePointer<Int8>) -> Int32 in
            return ikcp_send(self.kcp, byte, Int32(data.count))
        }
    }
    
    public func input(data:Data) -> Int32{
        return data.withUnsafeBytes { [unowned self](byte:UnsafePointer<Int8>) -> Int32 in
            return ikcp_input(self.kcp, byte, data.count)
        }
    }

    public func recv(bufferLen:Int32 = 1024) -> Data{
        let buffer = UnsafeMutablePointer<Int8>.allocate(capacity: Int(bufferLen))
        let len = ikcp_recv(self.kcp, buffer, bufferLen)
        return Data(bytes: buffer, count: Int(len))
    }
    
}
