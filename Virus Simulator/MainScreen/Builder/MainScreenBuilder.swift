//
//  MainScreenBuilder.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import UIKit

final class MainScreenBuilder {

    // MARK: - Functions

    static func build() -> UIViewController {
        let router = MainScreenRouter()
        let viewModel = MainScreenModel(router: router)
        let controller = MainScreenController(viewModel: viewModel)
        router.presenter = controller
        return controller
    }
}
