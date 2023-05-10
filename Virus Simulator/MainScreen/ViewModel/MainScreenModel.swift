//
//  MainScreenModel.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import Foundation

protocol MainScreenModelProtocol: AnyObject {
    
    // MARK: - Properties

    var items: [TableCellViewModelProtocol] { get }
    
    // MARK: - Functions

    func didTapButton(groupSize: Int)
}

final class MainScreenModel: MainScreenModelProtocol {

    // MARK: - Properties

    var router: MainScreenRouterProtocol
    var items: [TableCellViewModelProtocol] = []
    

    // MARK: - Constructor

    init(router: MainScreenRouterProtocol) {
        self.router = router
    }

    // MARK: - Functions
    
    func didTapButton(groupSize: Int) {
        router.moveToModeling(groupSize: groupSize)
    }
}
