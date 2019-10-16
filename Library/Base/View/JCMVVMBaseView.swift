//
//  JCMVVMBaseView.swift
//  JCMVVMPro
//
//  Created by jcYang on 2019/10/16.
//  Copyright © 2019年 com.jcYang. All rights reserved.
//

import UIKit

open class JCMVVMBaseView:UIView{
  
  ///是否自动加载子views，默认为true。如果你不想自动添加子view，则设为false，以此同时也无法自动执行添加约束的操作
  private var _shouldAddSubViewsAuto = true
  
  public var shouldAddSubViewsAuto : Bool{
    get{
      return _shouldAddSubViewsAuto
    }
    set{
      if newValue == _shouldAddSubViewsAuto {
        return
      }
      _shouldAddSubViewsAuto = newValue
      if _shouldAddSubViewsAuto {
        addAllSubViews()
      }else{
        removeAllSubViews()
      }
    }
  }
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  public init() {
    super.init(frame: CGRect.zero)
    setup()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("BaseView init(coder:) has not been implemented")
  }
  
  ///MARK: Public Functions
  
  
  ///MARK: Private Functions
  private func addAllSubViews() {
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
      self.addSubview(nonilSubView)
    }
  }
  private func removeAllSubViews(){
    //1.获取所有view属性
    let subViewProperties = JCMVVMMirrorManager.allProperties(self) { (name, value) -> Bool in
      guard let _ = value as? UIView else{
        return false
      }
      return true
    }
    
    //2.移除子views
    for (_,view) in subViewProperties{
      guard let nonilSubView = view as? UIView else{
        continue
      }
      nonilSubView.removeFromSuperview()
    }
  }
  private func setup() {
    self.backgroundColor = UIColor.white
    
    //自动添加左右子视图
    if _shouldAddSubViewsAuto {
      addAllSubViews()
    }
  }
}
