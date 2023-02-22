//
//  ViewController.swift
//  ByteCoin
//
//  Created by Ildar Garifullin on 22/02/2023.
//

import UIKit

class ByteCoinViewController: UIViewController {
    
    //MARK: - let/var
    
    var byteCoinStackView = UIStackView()
    
    private let byteCoinLabel: UILabel = {
        let label = UILabel()
        label.text = "ByteCoin"
        label.textColor = UIColor(named: "Title Color")
        label.font = UIFont.systemFont(ofSize: 50)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let coinView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let byteCoinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bitcoinsign.circle.fill")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let currencyLabel: UILabel = {
        let label = UILabel()
        label.text = "USD"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
//    private let currencyPickerView: UIPickerView = {
//        let picker = UIPickerView()
//        picker.translatesAutoresizingMaskIntoConstraints = false
//
//        return picker
//    }()
    
    //MARK: - life cycle funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
        view.backgroundColor = .systemBlue
    }
    
    //MARK: - flow funcs
    
    
    //MARK: - public
    
    
}

//MARK: - extensions setupViews

extension ByteCoinViewController {
    
    private func setupViews() {
        byteCoinStackView = UIStackView(
            arrangedSubviews: [
                byteCoinLabel,
                coinView
            ],
            axis: .vertical,
            spacing: 5,
            distribution: .fillProportionally)
        
        view.addSubview(byteCoinStackView)
    }
}

//MARK: - extensions setConstraints

extension ByteCoinViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            byteCoinStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            byteCoinStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            byteCoinStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            byteCoinStackView.heightAnchor.constraint(equalToConstant: 165)
        ])
        
        NSLayoutConstraint.activate([
            coinView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
