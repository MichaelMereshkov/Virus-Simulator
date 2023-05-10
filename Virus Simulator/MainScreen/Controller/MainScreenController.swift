//
//  MainScreenController.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import UIKit

final class MainScreenController: UIViewController {
    
    // MARK: - Views
    
    private lazy var groupSizeLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemBlue
        label.text = "Размер группы"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var groupSizeTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 6, height: textField.frame.height))
        textField.addTarget(self, action: #selector(groupSizeAllEvents), for: .allEvents)
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0.5
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var infectionFactorLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemBlue
        label.text = "Фактор инфекции"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var infectionFactorTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 6, height: textField.frame.height))
        textField.addTarget(self, action: #selector(infectionFactorAllEvents), for: .allEvents)
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0.5
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var numberInfectedLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemBlue
        label.text = "Период пересчёта"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var numberInfectedTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 6, height: textField.frame.height))
        textField.addTarget(self, action: #selector(numberInfectedAllEvents), for: .allEvents)
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0.5
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button: UIButton = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("Запустить моделирование", for: .normal)
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        button.setTitleColor(.white, for: .normal)

        return button
    }()
    
    // MARK: - Private properties

    private let viewModel: MainScreenModelProtocol
    

    // MARK: - Initialization

    init(viewModel: MainScreenModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("MainScreenController ::: init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupButton()
    }
    
    // MARK: - Private functions

    private func setupAppearance() {
        self.title = "Virus Simulator"
        view.backgroundColor = .white
        
        view.addSubview(groupSizeTextField)
        view.addSubview(groupSizeLabel)
        view.addSubview(infectionFactorLabel)
        view.addSubview(infectionFactorTextField)
        view.addSubview(numberInfectedLabel)
        view.addSubview(numberInfectedTextField)
        view.addSubview(button)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            groupSizeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            groupSizeLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            groupSizeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            
            groupSizeTextField.leftAnchor.constraint(equalTo: groupSizeLabel.leftAnchor),
            groupSizeTextField.rightAnchor.constraint(equalTo: groupSizeLabel.rightAnchor),
            groupSizeTextField.topAnchor.constraint(equalTo: groupSizeLabel.bottomAnchor, constant: 4),
            groupSizeTextField.heightAnchor.constraint(equalToConstant: 32),
            
            infectionFactorLabel.leftAnchor.constraint(equalTo: groupSizeLabel.leftAnchor),
            infectionFactorLabel.rightAnchor.constraint(equalTo: groupSizeLabel.rightAnchor),
            infectionFactorLabel.topAnchor.constraint(equalTo: groupSizeTextField.bottomAnchor, constant: 10),
            
            infectionFactorTextField.leftAnchor.constraint(equalTo: groupSizeLabel.leftAnchor),
            infectionFactorTextField.rightAnchor.constraint(equalTo: groupSizeLabel.rightAnchor),
            infectionFactorTextField.topAnchor.constraint(equalTo: infectionFactorLabel.bottomAnchor, constant: 4),
            infectionFactorTextField.heightAnchor.constraint(equalToConstant: 32),
            
            numberInfectedLabel.leftAnchor.constraint(equalTo: groupSizeLabel.leftAnchor),
            numberInfectedLabel.rightAnchor.constraint(equalTo: groupSizeLabel.rightAnchor),
            numberInfectedLabel.topAnchor.constraint(equalTo: infectionFactorTextField.bottomAnchor, constant: 10),
            
            numberInfectedTextField.leftAnchor.constraint(equalTo: groupSizeLabel.leftAnchor),
            numberInfectedTextField.rightAnchor.constraint(equalTo: groupSizeLabel.rightAnchor),
            numberInfectedTextField.topAnchor.constraint(equalTo: numberInfectedLabel.bottomAnchor, constant: 4),
            numberInfectedTextField.heightAnchor.constraint(equalToConstant: 32),
            
            button.leftAnchor.constraint(equalTo: groupSizeLabel.leftAnchor),
            button.rightAnchor.constraint(equalTo: groupSizeLabel.rightAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            button.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setupButton() {
        if groupSizeTextField.text != "", infectionFactorTextField.text != "", numberInfectedTextField.text != "" {
            button.backgroundColor = .systemBlue
            button.isEnabled = true
        } else {
            button.backgroundColor = .gray
            button.isEnabled = false
        }
    }

    // MARK: - Actions
    
    @objc
    func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        groupSizeTextField.resignFirstResponder()
        infectionFactorTextField.resignFirstResponder()
        numberInfectedTextField.resignFirstResponder()
        setupButton()
        }
    
    @objc
    func didTapButton() {
        let groupSize = Int(groupSizeTextField.text ?? "0") ?? 0
        viewModel.didTapButton(groupSize: groupSize)
    }
    
    @objc
    func groupSizeAllEvents(textField: UITextField) {
        let completeString = textField.text
        
        if completeString != "" {
            setupButton()
        }
        
        if let t: String = textField.text {
            textField.text = String(t.prefix(3))
        }
    }
    
    @objc
    func infectionFactorAllEvents(textField: UITextField) {
        let completeString = textField.text

        if completeString != "" {
            setupButton()
        }

        if let t: String = textField.text {
            textField.text = String(t.prefix(1))
        }
    }

    @objc
    func numberInfectedAllEvents(textField: UITextField) {
        let completeString = textField.text

        if completeString != "" {
            setupButton()
        }

        if let t: String = textField.text {
            textField.text = String(t.prefix(1))
        }
    }
}

