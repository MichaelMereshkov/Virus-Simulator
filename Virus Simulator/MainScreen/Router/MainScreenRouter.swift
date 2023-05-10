//
//  MainScreenRouter.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import UIKit

 public protocol MainScreenRouterProtocol: AnyObject {
    
    // MARK: - Functions
     
     func moveToModeling(groupSize: Int)
}

final class MainScreenRouter: MainScreenRouterProtocol {

    // MARK: - Properties

    weak var presenter: UIViewController?

    // MARK: - Functions
    
    func moveToModeling(groupSize: Int) {
        let controller = ModelingBuilder.build(groupSize: groupSize)
        presenter?.navigationController?.pushViewController(controller, animated: true)
    }
}
