//
//  FeaturedPlaylistCollectionViewCell.swift
//  Spotify
//
//  Created by Admin on 29.10.2023.
//

import UIKit

class FeaturedPlaylistCollectionViewCell: UICollectionViewCell {
    static let identifier = "FeaturedPlaylistCollectionViewCell"
    
    private let playlistCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let playlistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let creatorNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(playlistCoverImageView)
        contentView.addSubview(playlistNameLabel)
        contentView.addSubview(creatorNameLabel)
        addConstraints()
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        playlistNameLabel.text = nil
        creatorNameLabel.text = nil
        playlistCoverImageView.image = nil
    }
    
    private func addConstraints() {
        let imageSize = contentView.frame.height - 70
        NSLayoutConstraint.activate([
            
            playlistCoverImageView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            playlistCoverImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            playlistCoverImageView.heightAnchor.constraint(equalToConstant: imageSize),
            playlistCoverImageView.widthAnchor.constraint(equalToConstant: imageSize),
            
            playlistNameLabel.topAnchor.constraint(equalTo: playlistCoverImageView.bottomAnchor, constant: 3),
            playlistNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            playlistNameLabel.heightAnchor.constraint(equalToConstant: 34),
            playlistNameLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width - 6),
            
            creatorNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            creatorNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            creatorNameLabel.heightAnchor.constraint(equalToConstant: 34),
            creatorNameLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width - 6),
        ])
    }
    
    func configure(with viewModel: FeaturedPlaylistCellViewModel) {
        playlistNameLabel.text = viewModel.name
        playlistCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
        creatorNameLabel.text = viewModel.creatorName
    }
}
