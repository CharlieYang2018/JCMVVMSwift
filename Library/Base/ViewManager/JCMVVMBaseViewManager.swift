//
//  BaseViewManager.swift
//  JCMVVMSWIFT
//
//  Created by jcYang on 2019/9/12.
//  Copyright © 2019年 com.jcYang. All rights reserved.
//

import UIKit

open class JCMVVMBaseViewManager: JCMVVMViewManagerProtocol {
  ///是否自动加载子views，默认为true。如果你不想自动添加子view，则设为false，以此同时也无法自动执行添加约束的操作
  private var _shouldAddSubViewsAuto = true
  ///是否自动加载约束，默认使用。
  private var _shouldAddConstraintAuto = true
  ///controller
  weak private var _controller : UIViewController?
  ///super View
  weak var superView : UIView?
  
  public init(_ vc:UIViewController) {
    _controller = vc
    superView = vc.view
  }
  
  ///MARK:以下函数是viewmanager protocol函数的实现
  
  public var shouldAddSubViewsAuto: Bool{
    return _shouldAddSubViewsAuto
  }
  
  public var shouldAddConstraintAuto: Bool{
    return _shouldAddConstraintAuto
  }
  
  public var controller: UIViewController?{
    return _controller;
  }
  
  open func setupSubView() {
  }
  
  open func addSubViews(_ views: Array<UIView>?) {
    guard let nonilSuperView = self.superView else {
      return
    }
    //1.获取所有view属性
    let subViewProperties = JCMVVMMirrorManager.allProperties(self) { (name, value) -> Bool in
      guard let _ = value as? UIView else{
        return false
      }
      return true
    }
    
    //2.添加子views
    for (_,view) in subViewProperties{
      guard let nonilSubView = view as? UIView else{
        continue
      }
      nonilSuperView.addSubview(nonilSubView)
    }
  }
  
  open func addConstraints() {
    
  }
  
  open func setupOther() {
    
  }
  
  
  
  
}
