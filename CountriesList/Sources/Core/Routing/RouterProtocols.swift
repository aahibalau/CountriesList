//
//  Router.swift
//
//  Created by Andrei Ahibalau on 10/9/19.
//

import Foundation
import UIKit

protocol PushRouter {
  func push(_ controller: UIViewController, animated: Bool)
  func push(_ controller: UIViewController)
  func pop(animated: Bool)
  func pop()
}

extension PushRouter {
  func push(_ controller: UIViewController) {
    return push(controller, animated: true)
  }

  func pop() {
    return pop(animated: true)
  }
}

extension UIViewController {
  var topPresented: UIViewController {
    var controller = self
    while let next = controller.presentedViewController {
      controller = next
    }
    return controller
  }
  var currentTopViewController: UIViewController {
    if let navigationController = self as? UINavigationController {
      if let topViewController = navigationController.topViewController  {
        return topViewController.currentTopViewController
      }
    }
    return presentedViewController ?? self
  }
}
