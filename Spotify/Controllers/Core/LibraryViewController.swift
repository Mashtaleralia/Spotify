//
//  LibraryViewController.swift
//  Spotify
//
//  Created by Admin on 16.10.2023.
//

import UIKit

class LibraryViewController: UIViewController {

    
    private var playlistsVC = LibraryPlaylistsViewController()
    private var albumsVC = LibraryAlbumsViewController()
    
    private let toggleView = LibraryToggleView()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        scrollView.delegate = self
        toggleView.delegate = self
        view.addSubview(scrollView)
        view.addSubview(toggleView)
        addConstraints()
        scrollView.contentSize = CGSize(width: view.frame.width*2, height: scrollView.frame.height)
        addChildren()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top + 55),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            toggleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toggleView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 90),
            toggleView.widthAnchor.constraint(equalToConstant: 200),
            toggleView.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    private func addChildren() {
        addChild(playlistsVC)
        scrollView.addSubview(playlistsVC.view)
        playlistsVC.view.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.width)
        playlistsVC.didMove(toParent: self)
        
        addChild(albumsVC)
        scrollView.addSubview(albumsVC.view)
        albumsVC.view.frame = CGRect(x: view.frame.width, y: 0, width: scrollView.frame.width, height: scrollView.frame.width)
        albumsVC.didMove(toParent: self)
    }

}

extension LibraryViewController: LibraryToggleViewDelegate {
    func libraryToggleViewDidTapPlaylists(_ toggleView: LibraryToggleView) {
        scrollView.setContentOffset(.zero, animated: true)
    }
    
    func libraryToggleViewDidTapAlbums(_ toggleView: LibraryToggleView) {
        scrollView.setContentOffset(CGPoint(x: view.frame.width, y: 0), animated: true)
    }
    
}

extension LibraryViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x >= view.frame.width - 100 {
            toggleView.state = .album
        } else {
            toggleView.state = .playlist
        }
       
    }
}
