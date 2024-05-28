//
//  SettingsConfigurator.swift
//  Spotify
//
//  Created by Admin on 26.05.2024.
//

import Foundation

protocol SettingsConfigurator: AnyObject {
    func configure(settingsController: SettingsViewController)
}

class SettingsConfiguratorImplementation: SettingsConfigurator {
    func configure(settingsController: SettingsViewController) {
        let router = SettingsViewRouterImplementation(settingsViewController: settingsController)
        let presenter = SettingsPresenterImplementation(router: router)
        settingsController.presenter = presenter
    }
}
