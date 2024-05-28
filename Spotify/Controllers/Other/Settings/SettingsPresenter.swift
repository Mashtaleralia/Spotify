//
//  SettingsPresenter.swift
//  Spotify
//
//  Created by Admin on 25.05.2024.
//

import UIKit

protocol SettingsPresenter {
    var sections: [Section] {get set}
    func viewDidLoad()
    func configure(cell: UITableViewCell, forRow row: Int)
    func didSelect(at row: Int, section: Int)
}

class SettingsPresenterImplementation: SettingsPresenter {
    
    var sections = [Section]()
    var router: SettingsViewRouter
    
    init(router: SettingsViewRouter) {
        self.router = router
    }
    
    private func configureSections() {
        sections.append(Section(title: "Profile", options: [Option(title: "View your profile", handler: { [weak self] in
            DispatchQueue.main.async {
                self?.viewProfile()
            }
        })]))
        
        sections.append(Section(title: "Account", options: [Option(title: "Sign Out", handler: { [weak self] in
            DispatchQueue.main.async {
                self?.signOutTapped()
            }
        })]))
    }
    
    func viewProfile() {
        router.presentProfileVC()
    }
    
    func signOutTapped() {
        AuthManager.shared.signOut { signedOut in
            if signedOut {
                router.presentSignInVC()
            }
        }
    }
    
    func viewDidLoad() {
        configureSections()
    }
    
    func configure(cell: UITableViewCell, forRow row: Int) {
        let option = sections[row].options.first!.title
        cell.textLabel?.text = option
    }
    
    func didSelect(at row: Int, section: Int) {
        let model = sections[section].options[row]
        model.handler()
    }
    
    
}
