//
//  UITableView+Extension.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import UIKit

public extension UITableView {

    // MARK: - Functions

    func register<T: UITableViewCell>(_ type: T.Type) {
        register(type, forCellReuseIdentifier: type.cellId)
    }
}
