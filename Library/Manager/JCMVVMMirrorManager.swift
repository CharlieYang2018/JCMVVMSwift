//
//  MirrorManager.swift
//  JCMVVMSWIFT
//
//  Created by jcYang on 2019/9/23.
//  Copyright © 2019年 com.jcYang. All rights reserved.
//

import Foundation

typealias MIRROR_FILTER_FUNCTION = (_ label:String?,_ value:Any?) -> Bool
class JCMVVMMirrorManager {
  
  
  /// 获取所有属性
  ///
  /// - Parameters:
  ///   - obj: 对象
  ///   - filter: 过滤函数
  /// - Returns: 对象的属性集合
  class func allProperties(_ obj:Any, filter:MIRROR_FILTER_FUNCTION? = nil) -> Dictionary<String,Any?> {
    let mirror = Mirror(reflecting: obj)
    //1.获取所有属性
    var properties = [String:Any]()
    for case let (label,value) in mirror.children{
      if filter == nil{
        guard let nonilLabel = label else{
          continue
        }
        properties[nonilLabel] = value;
      }
      //2.过滤
      if filter!(label,value){
        guard let nonilLabel = label else{
          continue
        }
        properties[nonilLabel] = value;
      }
    }
    
    return properties;
    
  }
  
  class func getPropertyByKey(in obj:Any, with name:String) -> Any?{
    let propeties = self.allProperties(obj)
    if propeties.keys.contains(name) {
      return propeties[name] as Any?
    }
    return nil
  }
}
