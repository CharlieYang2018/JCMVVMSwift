//
//  BaseViewController.swift
//  JCMVVMSWIFT
//
//  Created by jcYang on 2019/9/18.
//  Copyright © 2019年 com.jcYang. All rights reserved.
//

import UIKit

open class JCMVVMBaseViewController:UIViewController,JCMVVMViewControllerProtocol{
  //View manager. 在派生的controller中重写这个变量
  open var viewManager : JCMVVMViewManagerProtocol?{
    return nil;
  }
  
  public init() {
    super.init(nibName: nil, bundle: nil)
    setup()
  }
  
  public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  ///MARK: Private functions----
  private func setup()  {
    //1.
    setupViewManager()
  }
  
  private func setupViewManager(){
    guard let nonilViewManager = self.viewManager else {
      return
    }
    //1.
    nonilViewManager.setupSubView()
    //2.
    if nonilViewManager.shouldAddSubViewsAuto{
      nonilViewManager.addSubViews(nil)
    }
    //3.
    if nonilViewManager.shouldAddConstraintAuto {
      nonilViewManager.addConstraints()
    }
    //4.
    nonilViewManager.setupOther()
    
  }
  
}
