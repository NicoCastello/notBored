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
    
    func pushToRootView() {
        self.navigationController.popToRootViewController(animated: true)
        self.navigationController.setNavigationBarHidden(false, animated: false)
    }
    
    func pushToActivity(participants: Int) {
        let viewController = ActivityViewController()
        viewController.coordinator = self
        viewController.participants = participants
        self.navigationController.navigationBar.topItem!.title = ""
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func pushToSuggestion(participants: Int, activity: String) {
        let viewController = SuggestionViewController()
        viewController.coordinator = self
        viewController.participants = participants
        viewController.activity = activity
        self.navigationController.navigationBar.topItem!.title = "Activity"
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
