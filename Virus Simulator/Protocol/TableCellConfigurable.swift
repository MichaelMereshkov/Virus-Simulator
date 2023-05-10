//
//  TableCellConfigurable.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import Foundation

public protocol TableCellConfigurable: AnyObject {

    // MARK: - Functions

    func setup(viewModel: TableCellViewModelProtocol)
}
