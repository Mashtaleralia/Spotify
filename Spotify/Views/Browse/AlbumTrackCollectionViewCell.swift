//
//  AlbumTrackCollectionViewCell.swift
//  Spotify
//
//  Created by Admin on 10.11.2023.
//

import UIKit

class AlbumTrackCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AlbumTrackCollectionViewCell"
    
    private let trackNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "cum"
        //label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .light)
       // label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        
        contentView.addSubview(trackNameLabel)
        contentView.addSubview(artistNameLabel)
        addConstraints()
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        trackNameLabel.text = nil
        artistNameLabel.text = nil
        
    }
    
    private func addConstraints() {
        let imageSize = contentView.frame.height - 8
        NSLayoutConstraint.activate([
            
            trackNameLabel.topAnchor.constraint(equalTo:topAnchor, constant: 4),
            trackNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            trackNameLabel.heightAnchor.constraint(equalToConstant: 24),
            trackNameLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width - 6),
            
            artistNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            artistNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            artistNameLabel.heightAnchor.constraint(equalToConstant: 24),
            artistNameLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width - 6),
        ])
    }
    
    func configure(with viewModel: AlbumCollectionViewCellViewModel) {
        trackNameLabel.text = viewModel.name
        artistNameLabel.text = viewModel.artistName
    }
}
