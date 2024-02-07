//
//  LibraryPlaylistsViewController.swift
//  Spotify
//
//  Created by Admin on 03.02.2024.
//

import UIKit

class LibraryPlaylistsViewController: UIViewController {
    
    var playlists = [Playlist]()
    
    private let noPlaylistsView = ActionView()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SearchResultSubtitleTableViewCell.self, forCellReuseIdentifier: SearchResultSubtitleTableViewCell.identifier)
        tableView.isHidden = true
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        setUpNoPlaylistsView()
        addConstraints()
        fetchPlaylists()
    }
    
    private func fetchPlaylists() {
        APICaller.shared.getCurrentUserPlaylist { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let playlists):
                    self?.playlists = playlists
                    self?.updateUI()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func setUpNoPlaylistsView() {
        view.addSubview(noPlaylistsView)
        noPlaylistsView.delegate = self
        noPlaylistsView.configure(with: ActionViewViewModel(text: "You don't have any playlists yet", actionTitle: "Create"))
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            noPlaylistsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noPlaylistsView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noPlaylistsView.widthAnchor.constraint(equalToConstant: 150),
            noPlaylistsView.heightAnchor.constraint(equalToConstant: 150),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
     
    private func updateUI() {
        if playlists.isEmpty {
            // show label
            noPlaylistsView.isHidden = false
            tableView.isHidden = true
        } else {
            // show table
            tableView.reloadData()
            noPlaylistsView.isHidden = true
            tableView.isHidden = false
        }
    }
    
    private func showCreatePlaylistAlert() {
        let alert = UIAlertController(title: "New Playlists", message: "Enter Playlist Name", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Playlist..."
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
                return
            }
            
            APICaller.shared.createPlaylist(with: text) { success in
                if success {
                    
                } else {
                    print("Failed to create playlist")
                }
            }
        }))
        
        present(alert, animated: true)
    }

}

extension LibraryPlaylistsViewController: ActionLabelViewDelegate {
    func actionViewDidTapButton(_ actionView: ActionView) {
        showCreatePlaylistAlert()
    }
}

extension LibraryPlaylistsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultSubtitleTableViewCell.identifier, for: indexPath) as? SearchResultSubtitleTableViewCell else {
            return UITableViewCell()
        }
        let playlist = playlists[indexPath.row]
        cell.configure(with: SearchResultSubtitleTableViewCellViewModel(title: playlist.name, subtitle: playlist.owner.display_name, imageURL: URL(string: playlist.images.first?.url ?? "")))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let playlist = playlists[indexPath.row]
        let vc = PlaylistViewController(playlist: playlist)
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
