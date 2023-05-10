//
//  ModelingController.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import UIKit

final class ModelingController: UIViewController {
    
    // MARK: - Views
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        //f.itemSize = CGSize(width: 100, height: 100)
        //f.minimumInteritemSpacing = CGFloat.greatestFiniteMagnitude
        flowLayout.minimumLineSpacing = 2
        flowLayout.minimumInteritemSpacing = 2
        return flowLayout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        //collectionView.separatorStyle = .none
        //collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.register(ModelingCell.self, forCellWithReuseIdentifier: ModelingCell.cellId)

        return collectionView
    }()
    
    // MARK: - Private properties

    private let viewModel: ModelingModelProtocol
    

    // MARK: - Initialization

    init(viewModel: ModelingModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("ModelingController ::: init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    
    // MARK: - Private functions

    private func setupAppearance() {
        self.title = "Моделирование"
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 2),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -2),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    // MARK: - Actions
    
}

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource

extension ModelingController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = viewModel.items.element(at: indexPath.section) else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.cellId, for: indexPath)
        if let cell = cell as? TableCellConfigurable {
            cell.setup(viewModel: item)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(indexPath: indexPath)
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameVC = collectionView.frame
        let widthCell = frameVC.width / CGFloat(4)
        let heightCell = widthCell
        
        let spacing = CGFloat((4 + 1) * 2 / 4)
        
        return CGSize(width: widthCell - spacing, height: heightCell - CGFloat(2*2))
    }
}


