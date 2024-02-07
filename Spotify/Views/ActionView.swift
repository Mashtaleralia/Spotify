//
//  ActionView.swift
//  Spotify
//
//  Created by Admin on 04.02.2024.
//

import UIKit

struct ActionViewViewModel {
    let text: String
    let actionTitle: String
}

protocol ActionLabelViewDelegate: AnyObject {
    func actionViewDidTapButton(_ actionView: ActionView)
}

class ActionView: UIView {
    
    weak var delegate: ActionLabelViewDelegate?
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.link, for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        //backgroundColor = .red
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        addSubview(button)
        addConstraints()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapButton() {
        delegate?.actionViewDidTapButton(self)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 150),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            button.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    public func configure(with viewModel: ActionViewViewModel) {
        label.text = viewModel.text
        button.setTitle(viewModel.actionTitle, for: .normal)
    }
    
}
