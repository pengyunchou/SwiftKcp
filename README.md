# SwiftKcp

KCP - A Fast and Reliable ARQ Protocol

## install

* carthage

>github "aixinyunchou/SwiftKcp"
## usage

1. input swiftkcp

> import SwiftKcp
2. create kcp object:

> let sender = Kcp(outputer:self)
2. setup output delegate:

> func kcp(kcp:Kcp,outputData:Data) -> Int{
>    //just send data to you udp or tcp target
> }
3. call update in an interval:

> sender.update(millisec:now)
4. input lower layer data packet:

>let reciveData = //read data from you tcp or udp socket
>sender.input(data:reciveData)

