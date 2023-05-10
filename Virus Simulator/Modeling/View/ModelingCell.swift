//
//  ModelingCell.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import UIKit

final class ModelingCell: UICollectionViewCell, TableCellConfigurable {

    // MARK: - Views
    
    private lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: "person")
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return iconImageView
    }()

    // MARK: - Private properties

    private var viewModel: ModelingItemsModelProtocol?
    
    // MARK: - Constructor

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAppearance()
    }

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        layer.mask = nil
    }

    // MARK: - Functions

    func setup(viewModel: TableCellViewModelProtocol) {
        guard let viewModel = viewModel as? ModelingItemsModelProtocol else { return }
        self.viewModel = viewModel
        
        if viewModel.isActive == true {
            backgroundColor = .red
            layer.borderColor = UIColor.red.cgColor
            iconImageView.tintColor = .black
        }
    }

    // MARK: - Private functions

    private func setupAppearance() {
        backgroundColor = .clear
        layer.borderColor = UIColor.systemBlue.cgColor
        layer.cornerRadius = 8
        layer.borderWidth = 1

        contentView.addSubview(iconImageView)
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            iconImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            iconImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

