//
//  ModelingRouter.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import UIKit

 public protocol ModelingRouterProtocol: AnyObject {
    
}

final class ModelingRouter: ModelingRouterProtocol {

    // MARK: - Properties

    weak var presenter: UIViewController?
}
