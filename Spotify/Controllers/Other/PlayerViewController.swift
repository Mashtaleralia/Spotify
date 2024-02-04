//
//  PlayerViewController.swift
//  Spotify
//
//  Created by Admin on 16.10.2023.
//

import UIKit
import SDWebImage

protocol PlayerViewControllerDelegate: AnyObject {
    func didTapPlayPause()
    func didTapForward()
    func didTapBackward()
    func didSlideSlider(_ value: Float)
}
 
class PlayerViewController: UIViewController {
    
    weak var dataSource: PlayerDataSource?
    
    weak var delegate: PlayerViewControllerDelegate?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var controlsView = PlayerControlsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(controlsView)
        controlsView.delegate = self
        addConstraints()
        configureBarButtons()
        configure()
    }
    
    public func refreshUI() {
        
        configure()
    }
    
    private func addConstraints() {
        let controlsHeight = view.frame.height - imageView.frame.height - 15 - view.safeAreaInsets.bottom - view.safeAreaInsets.top
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: view.frame.width),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.width),
            controlsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            controlsView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            controlsView.widthAnchor.constraint(equalToConstant: view.frame.width - 20),
            controlsView.heightAnchor.constraint(equalToConstant: controlsHeight)
        ])
    }
    
    private func configure() {
        imageView.sd_setImage(with: dataSource?.imageURL, completed: nil)
        controlsView.configure(with: PlayerControlsViewViewModel(
            title: dataSource?.song,
            subtitle: dataSource?.subtitle))
    }
 
    private func configureBarButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapAdd))
    }
    
    @objc private func didTapAdd() {
        
    }
    
    @objc private func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
}

extension PlayerViewController: PlayerControlsViewDelegate {
    
    func playerControlsViewDidSlideVolume(_ playerControlsView: PlayerControlsView, didSlideSlider volume: Float) {
        delegate?.didSlideSlider(volume)
    }
    
    func playerControlsViewDidTapPlayPauseButton(_ playerControlsView: PlayerControlsView) {
        delegate?.didTapPlayPause()
    }
    
    func playerControlsViewDidTapForwardButton(_ playerControlsView: PlayerControlsView) {
        delegate?.didTapForward()
    }
    
    func playerControlsViewDidTapBackwardButton(_ playerControlsView: PlayerControlsView) {
        delegate?.didTapBackward()
    }
    
    
}
