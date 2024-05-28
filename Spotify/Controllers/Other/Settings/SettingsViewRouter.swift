//
//  SettingsViewRouter.swift
//  Spotify
//
//  Created by Admin on 25.05.2024.
//

import UIKit

protocol SettingsViewRouter {
    func presentProfileVC()
    func presentSignInVC()
}

class SettingsViewRouterImplementation: SettingsViewRouter {
    
    fileprivate weak var settingsViewController: SettingsViewController?
    
    init(settingsViewController: SettingsViewController) {
        self.settingsViewController = settingsViewController
    }
    
    func presentProfileVC() {
        let vc = ProfileViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Profile"
        settingsViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentSignInVC() {
        let navVC = UINavigationController(rootViewController: WelcomeViewController())
        navVC.navigationBar.prefersLargeTitles = true
        navVC.viewControllers.first?.navigationItem.largeTitleDisplayMode = .always
        navVC.modalPresentationStyle = .fullScreen
        settingsViewController?.present(navVC, animated: true, completion: {
            self.settingsViewController?.navigationController?.popToRootViewController(animated: false)
        })
    }
}

