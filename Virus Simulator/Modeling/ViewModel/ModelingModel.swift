//
//  ModelingModel.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import Foundation

protocol ModelingModelProtocol: AnyObject {
    
    // MARK: - Properties

    var items: [TableCellViewModelProtocol] { get }
    var groupSize: Int { get }
    
    // MARK: - Functions

    func didSelectItemAt(indexPath: IndexPath)
}

final class ModelingModel: ModelingModelProtocol {

    // MARK: - Properties

    var router: ModelingRouterProtocol
    var items: [TableCellViewModelProtocol] = []
    var groupSize: Int

    // MARK: - Constructor

    init(router: ModelingRouterProtocol, groupSize: Int) {
        self.router = router
        self.groupSize = groupSize
        
        items.append(contentsOf: Array(repeating: ModelingItemsModel(isActive: false), count: groupSize))
    }

    // MARK: - Functions
    
    func didSelectItemAt(indexPath: IndexPath) {
        guard let item = items.element(at: indexPath.row) as? ModelingItemsModelProtocol else { return }
        item.isActive = true

    }
}
