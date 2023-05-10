//
//  ModelingItemsModel.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import Foundation
import UIKit

public protocol ModelingItemsModelProtocol: AnyObject {
    
    // MARK: - Properties
    
    var isActive: Bool { get set }
    }

final class ModelingItemsModel: ModelingItemsModelProtocol, TableCellViewModelProtocol {


    // MARK: - Properties

    var cellId: String {
        return ModelingCell.cellId
    }
    var isActive: Bool

    // MARK: - Constructor

    init(isActive: Bool) {
        self.isActive = isActive
    }
}


