//
//  SearchResultViewController.swift
//  Spotify
//
//  Created by Admin on 16.10.2023.
//

import UIKit

struct SearchSection {
    let title: String
    let results: [SearchResult]
}

protocol SearchResultViewControllerDelegate: AnyObject {
    func showResult(_ controller: UIViewController)
    func didTapResult(_ result: SearchResult)
}

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: SearchResultViewControllerDelegate?
    
    private var sections: [SearchSection] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SearchResultDefaultTableViewCell.self, forCellReuseIdentifier: SearchResultDefaultTableViewCell.identifier)
        tableView.register(SearchResultSubtitleTableViewCell.self, forCellReuseIdentifier: SearchResultSubtitleTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isHidden = true
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    func update(with results: [SearchResult]) {
        
        let artists = results.filter {
            switch $0 {
            case .artist: return true
            default: return false
            }
        }
        
        let albums = results.filter {
            switch $0 {
            case .album:
                return true
            default:
                return false
            }
        }
        
        let tracks = results.filter {
            switch $0 {
            case .track:
                return true
            default:
                return false
            }
        }
        
        let playlists = results.filter {
            switch $0 {
            case .playlist:
                return true
            default:
                return false
            }
        }
        
        
        
//        artist(model: Artist)
//        case album(model: Album)
//        case track(model: AudioTrack)
//        case playlis
        
        self.sections = [
            SearchSection(title: "artist", results: artists),
            SearchSection(title: "albums", results: albums),
            SearchSection(title: "tracks", results: tracks),
            SearchSection(title: "playlists", results: playlists),
        ]
//
        DispatchQueue.main.async {
            self.tableView.isHidden = results.isEmpty
            self.tableView.reloadData()
        }
       
       
    }
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].results.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let result = sections[indexPath.section].results[indexPath.row]
        delegate?.didTapResult(result)
//        switch result {
//        case .artist(let model):
//            break
//        case .album(let model):
//            let vc = AlbumViewController(album: model)
//            delegate?.showResult(vc)
//        case .track(let model):
//            break
//        case .playlist(let model):
//            let vc = PlaylistViewController(playlist: model)
//            delegate?.showResult(vc)
 //       }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = sections[indexPath.section].results[indexPath.row]
        
        switch result {
        case .artist(let artist):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultDefaultTableViewCell.identifier, for: indexPath) as? SearchResultDefaultTableViewCell else {
                 return UITableViewCell()
            }
            let viewModel = SearchResultDefaultTableViewCellViewModel(title: artist.name, imageUrl: URL(string: artist.images?.first?.url ?? ""))
            cell.configure(with: viewModel) 
            return cell
        case .album(let album):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultSubtitleTableViewCell.identifier, for: indexPath) as? SearchResultSubtitleTableViewCell else {
                 return UITableViewCell()
            }
            let viewModel = SearchResultSubtitleTableViewCellViewModel(title: album.name, subtitle: album.artists.first?.name ?? "", imageURL: URL(string: album.images.first?.url ?? ""))
            cell.configure(with: viewModel)
            return cell
        case .track(let track):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultSubtitleTableViewCell.identifier, for: indexPath) as? SearchResultSubtitleTableViewCell else {
                 return UITableViewCell()
            }
            let viewModel = SearchResultSubtitleTableViewCellViewModel(title: track.name, subtitle: track.artists.first?.name ?? "", imageURL: URL(string: track.album?.images.first?.url ?? ""))
            cell.configure(with: viewModel)
            return cell
        case .playlist(let playlist):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultSubtitleTableViewCell.identifier, for: indexPath) as? SearchResultSubtitleTableViewCell else {
                 return UITableViewCell()
            }
            let viewModel = SearchResultSubtitleTableViewCellViewModel(title: playlist.name, subtitle: playlist.owner.display_name, imageURL: URL(string: playlist.images.first?.url ?? ""))
            cell.configure(with: viewModel)
            return cell
        }
         
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }


}
