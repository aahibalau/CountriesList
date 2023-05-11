//
//  NavigationRouter.swift
//  
//
//  Created by Andrei Ahibalau on 10/11/19.
//

import UIKit

class NavigationRouter: PushRouter {
  private var groupStack: [Int] = []
  private var navigationController: UINavigationController
  private var topPresented: UIViewController {
    return navigationController.topPresented
  }

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func endEditing(_ force: Bool) {
    navigationController.view.endEditing(force)
  }

  // push to existing nav stack
  func push(_ controller: UIViewController, animated: Bool) {
    endEditing(true)
    controller.hidesBottomBarWhenPushed = true
    navigationController.pushViewController(controller, animated: animated)
  }

  func pop(animated: Bool) {
    endEditing(true)
    navigationController.popViewController(animated: animated)
  }
}
