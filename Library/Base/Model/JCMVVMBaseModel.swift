//
//  JCMVVMBaseModel.swift
//  JCMVVMPro
//
//  Created by jcYang on 2019/10/16.
//  Copyright © 2019年 com.jcYang. All rights reserved.
//

import Foundation

open class JCMVVMBaseModel : NSObject {
  /// translate json to model
  ///
  /// - Parameter json: json contents
  public class func modelFrom<T:Codable>(_ json:Dictionary<String,Any>) -> T?{
    do{
      let data = try JSONSerialization.data(withJSONObject: json, options: [])
      let model = try JSONDecoder().decode(T.self, from: data)
      return model
    }catch{
      print("json translate mode failure:\(error)")
    }
    
    return nil
  }
}
