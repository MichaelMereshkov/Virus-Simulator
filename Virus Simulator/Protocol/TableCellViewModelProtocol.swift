//
//  TableCellViewModelProtocol.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import Foundation

public protocol TableCellViewModelProtocol: AnyObject {

    // MARK: - Properties

    var cellId: String { get }

    // MARK: - Methods

    func didTapButton()
}

public extension TableCellViewModelProtocol {

    func didTapButton() {}
}
