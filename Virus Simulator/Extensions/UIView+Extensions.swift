//
//  UIView+Extensions.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import UIKit

public extension UIView {

    // MARK: - Properties

    class var cellId: String {
        return (NSStringFromClass(self) as NSString).pathExtension
    }
}


