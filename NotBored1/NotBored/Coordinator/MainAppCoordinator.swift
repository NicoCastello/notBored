//
//  MainAppCoordinator.swift
//  NotBored
//
//  Created by Nicolas Castello Luro on 03/11/2021.
//

import UIKit

class MainAppCoordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var menuOpened: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = InitialViewController()
        viewController.coordinator = self
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func pushToTermsAndConditions() {
        let viewController = TermsAndConditionsViewController()
        viewController.coordinator = self
        self.navigationController.setNavigationBarHidden(true, animated: false)
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func pushToBackView() {
        self.navigationController.popViewController(animated: true)
    }
    
    func pushToActivity() {
        let viewController = ActivityViewController()
        viewController.coordinator = self
        self.navigationController.navigationBar.topItem!.title = "Home"
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
