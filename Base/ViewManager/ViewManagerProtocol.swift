//
//  ViewManagerProtocol.swift
//  LaijieMusic
//
//  Created by jcYang on 2019/9/12.
//  Copyright © 2019年 com.jcYang. All rights reserved.
//

import UIKit

protocol ViewManagerProtocol {
  ///是否自动加载子views.如果你想自动加载子views的话，设为true；如果你不想自动添加子view，则设为false，以此同时也无法自动执行添加约束的操作
  var shouldAddSubViewsAuto : Bool{get}
  ///是否自动加载约束。
  var shouldAddConstraintAuto : Bool{get}
  ///控制器
  var controller : UIViewController?{get}
  
  ///设置子view样式
  func setupSubView()
  
  ///添加子views
  func addSubViews(_ views:Array<UIView>?)
  
  ///添加约束
  func addConstraints()
  
  ///设置其他
  func setupOther()
  
}
