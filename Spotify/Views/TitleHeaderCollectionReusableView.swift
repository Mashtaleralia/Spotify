//
//  TitleHeaderCollectionReusableView.swift
//  Spotify
//
//  Created by Admin on 07.11.2023.
//

import UIKit

class TitleHeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "TitleHeaderCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(label)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 15),
        ])
    }
    
    public func configure(with title: String) {
        label.text = title
    }
    
    
}
