//
//  SectionViewModelProtocol.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import Foundation
import UIKit

protocol SectionViewModelProtocol {

    // MARK: - Properties

    var headerTitle: String? { get }
    var items: [TableCellViewModelProtocol] { get }
}
