//
//  coordinatorProtocol.swift
//  NotBored
//
//  Created by Nicolas Castello Luro on 03/11/2021.
//

import UIKit

protocol CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
