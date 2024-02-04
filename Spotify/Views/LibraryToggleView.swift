//
//  LibraryToggleView.swift
//  Spotify
//
//  Created by Admin on 03.02.2024.
//

import UIKit

protocol LibraryToggleViewDelegate: AnyObject {
    func libraryToggleViewDidTapPlaylists(_ toggleView: LibraryToggleView)
    func libraryToggleViewDidTapAlbums(_ toggleView: LibraryToggleView)
}

class LibraryToggleView: UIView {
    
    enum State {
        case playlist
        case album
    }
    
    var state: State = .playlist {
        didSet {
            self.layoutIndicator()
        }
    }
    
    private var playlistConstraint: NSLayoutConstraint?
    private var albumConstraint: NSLayoutConstraint?
    
    weak var delegate: LibraryToggleViewDelegate?
    
    private let playlistButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Playlists", for: .normal)
        return button
    }()
    
    private let albumsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Albums", for: .normal)
        return button
    }()
    
    private let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 4.0
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .red
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(albumsButton)
        addSubview(playlistButton)
        addSubview(indicatorView)
        addConstraints()
        playlistButton.addTarget(self, action: #selector(didTapPlaylists), for: .touchUpInside)
        albumsButton.addTarget(self, action: #selector(didTapAlbums), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapPlaylists() {
        state = .playlist
        UIView.animate(withDuration: 0.5) {
            self.layoutIndicator()
        }
        delegate?.libraryToggleViewDidTapPlaylists(self)
    }
    
    @objc private func didTapAlbums() {
        state = .album
        UIView.animate(withDuration: 0.5) {
            self.layoutIndicator()
        }
        delegate?.libraryToggleViewDidTapAlbums(self)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            playlistButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            playlistButton.topAnchor.constraint(equalTo: topAnchor),
            playlistButton.widthAnchor.constraint(equalToConstant: 100),
            playlistButton.heightAnchor.constraint(equalToConstant: 50),
            albumsButton.leadingAnchor.constraint(equalTo: playlistButton.trailingAnchor, constant: 5),
            albumsButton.topAnchor.constraint(equalTo: topAnchor),
            albumsButton.widthAnchor.constraint(equalToConstant: 100),
            albumsButton.heightAnchor.constraint(equalToConstant: 50),
            //indicatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            indicatorView.topAnchor.constraint(equalTo: playlistButton.bottomAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: 100),
            indicatorView.heightAnchor.constraint(equalToConstant: 3)
        ])
        
        playlistConstraint = indicatorView.leadingAnchor.constraint(equalTo: leadingAnchor)
        
        albumConstraint = indicatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100)
        
    }
    
    
    private func layoutIndicator() {
        
        switch state {
        case .playlist:
            playlistConstraint?.isActive = true
            albumConstraint?.isActive = false
        case .album:
            playlistConstraint?.isActive = false
            albumConstraint?.isActive = true
        }
    }
    
}
