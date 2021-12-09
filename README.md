# JRACRequest

[![CI Status](https://img.shields.io/travis/slark/JRACRequest.svg?style=flat)](https://travis-ci.org/slark/JRACRequest)
[![Version](https://img.shields.io/cocoapods/v/JRACRequest.svg?style=flat)](https://cocoapods.org/pods/JRACRequest)
[![License](https://img.shields.io/cocoapods/l/JRACRequest.svg?style=flat)](https://cocoapods.org/pods/JRACRequest)
[![Platform](https://img.shields.io/cocoapods/p/JRACRequest.svg?style=flat)](https://cocoapods.org/pods/JRACRequest)

## 介绍

通过 ReactiveObjc 和 YTKNetwork 结合的方式，实现了 OC 版本的网络响应框架

## 例子

JRBaseRequest 默认实现 post 方式的网络请求。 request 和 response 的序列化都是采用JSON的方式。

数据格式：
{
    code = 200;
    data = "<null>";
    msg = OK;
    timestamp = 20211209124400;
}

如果需要调整，请求方式，序列化格式等，可以通过继承重新 JRBaseRequest 的相关方法。
  
Demo：
先进行 YTKNetworkConfig 的配置   
然后通过 创建 DemoRequest 和 DemoViewModel 类， 分别实现 请求接口、数据传递 和 Singal到Command 转化。
  
在 ViewController 实现 ViewModel 的 binding 和 execute。 


## Requirements

## Installation

JRACRequest is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JRACRequest'
```

## Author

slark, jruijqx@163.com

## License

JRACRequest is available under the MIT license. See the LICENSE file for more info.
