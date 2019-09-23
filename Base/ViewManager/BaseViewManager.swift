//
//  BaseViewManager.swift
//  LaijieMusic
//
//  Created by jcYang on 2019/9/12.
//  Copyright © 2019年 com.jcYang. All rights reserved.
//

import UIKit

class BaseViewManager: ViewManagerProtocol {
  ///是否自动加载子views，默认为true。如果你不想自动添加子view，则设为false，以此同时也无法自动执行添加约束的操作
  private var _shouldAddSubViewsAuto = true
  ///是否自动加载约束，默认使用。
  private var _shouldAddConstraintAuto = true
  ///controller
  weak private var _controller : UIViewController?
  ///super View
  weak var superView : UIView?
  
  init(_ vc:UIViewController) {
    _controller = vc
    superView = vc.view
  }
  
  ///MARK:以下函数是viewmanager protocol函数的实现
  
  var shouldAddSubViewsAuto: Bool{
    return _shouldAddSubViewsAuto
  }
  
  var shouldAddConstraintAuto: Bool{
    return _shouldAddConstraintAuto
  }
  
  var controller: UIViewController?{
    return _controller;
  }
  
  func setupSubView() {
  }
  
  func addSubViews(_ views: Array<UIView>?) {
    guard let nonilSuperView = self.superView else {
      return
    }
    //1.获取所有view属性
    let subViewProperties = MirrorManager.allProperties(self) { (name, value) -> Bool in
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
  
  func addConstraints() {
    
  }
  
  func setupOther() {
    
  }
  
  
  
  
}
