//
//  ViewController.swift
//  ByteCoin
//
//  Created by Ildar Garifullin on 22/02/2023.
//

import UIKit

class ByteCoinViewController: UIViewController {
    
    //MARK: - let/var
    
    let coinManager = CoinManager()
    
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
    
    var coinStackView = UIStackView()
    
    private let byteCoinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bitcoinsign.circle.fill")
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
    
    private var currencyPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .clear
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        return picker
    }()
    
    //MARK: - life cycle funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
        view.backgroundColor = .systemBlue
        
        currencyPickerView.dataSource = self
        currencyPickerView.delegate = self
    }
    
    //MARK: - flow funcs
    
    
    //MARK: - public
    
    
}

//MARK: - extensions UIPickerViewDataSource

extension ByteCoinViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

//MARK: - extensions UIPickerViewDelegate

extension ByteCoinViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print(coinManager.performRequest(urlString: "\("https://rest.coinapi.io/v1/exchangerate/BTC")/\("EUR")?apikey=\("???")"))
        return coinManager.getCoinPrice(for: coinManager.currencyArray[row])
    }
    
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
        
        coinStackView = UIStackView(
            arrangedSubviews: [
                byteCoinImageView,
                valueLabel,
                currencyLabel
            ],
            axis: .horizontal,
            spacing: 2,
            distribution: .fillProportionally
        )
        coinView.addSubview(coinStackView)
        
        view.addSubview(currencyPickerView)
    }
}

//MARK: - extensions setConstraints

extension ByteCoinViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            byteCoinStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            byteCoinStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            byteCoinStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            coinView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            valueLabel.widthAnchor.constraint(equalToConstant: 210)
        ])
        
        NSLayoutConstraint.activate([
            coinStackView.centerYAnchor.constraint(equalTo: coinView.centerYAnchor),
            coinStackView.centerXAnchor.constraint(equalTo: coinView.centerXAnchor),
            coinStackView.widthAnchor.constraint(equalToConstant: 364),
            coinStackView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            currencyPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            currencyPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            currencyPickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
