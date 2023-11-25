//
//  RecommendedTrackCollectionViewCell.swift
//  Spotify
//
//  Created by Admin on 29.10.2023.
//

import UIKit

class RecommendedTrackCollectionViewCell: UICollectionViewCell {
    static let identifier = "RecommendedTrackCollectionViewCell"
    
    private let albumCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let trackNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
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
        contentView.addSubview(albumCoverImageView)
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
        albumCoverImageView.image = nil
    }
    
    private func addConstraints() {
        let imageSize = contentView.frame.height - 8
        NSLayoutConstraint.activate([
            
            albumCoverImageView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            albumCoverImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            albumCoverImageView.heightAnchor.constraint(equalToConstant: imageSize),
            albumCoverImageView.widthAnchor.constraint(equalToConstant: imageSize),
            
            trackNameLabel.topAnchor.constraint(equalTo:topAnchor, constant: 4),
            trackNameLabel.leadingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: 3),
            trackNameLabel.heightAnchor.constraint(equalToConstant: 24),
            trackNameLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width - 6),
            
            artistNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            artistNameLabel.leadingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: 3),
            artistNameLabel.heightAnchor.constraint(equalToConstant: 24),
            artistNameLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width - 6),
        ])
    }
    
    func configure(with viewModel: RecommendedTrackCellViewModel) {
        trackNameLabel.text = viewModel.name
        albumCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
        artistNameLabel.text = viewModel.artistName
    }
}
