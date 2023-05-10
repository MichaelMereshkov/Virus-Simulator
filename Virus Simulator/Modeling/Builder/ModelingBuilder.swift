//
//  ModelingBuilder.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import UIKit

final class ModelingBuilder {

    // MARK: - Functions

    static func build(groupSize: Int) -> UIViewController {
        let router = ModelingRouter()
        let viewModel = ModelingModel(router: router, groupSize: groupSize)
        let controller = ModelingController(viewModel: viewModel)
        router.presenter = controller
        return controller
    }
}
